#!/bin/bash
set -e
export SA_NAME=lab2-cr-service
export PROJECT_ID=test-antigravity-dec-2025

# Fix line endings
sed -i 's/\r$//' setup.sh

echo "Starting setup..."

# IAM Setup
echo "Creating Service Account..."
if ! gcloud iam service-accounts describe ${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com --project=$PROJECT_ID >/dev/null 2>&1; then
  gcloud iam service-accounts create $SA_NAME --display-name="Service Account for lab 2" --project=$PROJECT_ID
  echo "Sleeping 20s for propagation..."
  sleep 20
else
  echo "Service Account already exists."
fi

echo "Adding IAM bindings..."
# Sometimes it takes a while regardless
gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role="roles/run.invoker"

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role="roles/aiplatform.user"

# Move agent.py
echo "Moving agent.py..."
mkdir -p ~/zoo_guide_agent
mv ~/agent.py ~/zoo_guide_agent/agent.py || true

# Check if .env and requirements.txt exist, if not create them (safety net)
if [ ! -f .env ]; then
  echo "Creating .env..."
  cat <<EOF > .env
MODEL="gemini-2.5-flash"
MCP_SERVER_URL=https://zoo-mcp-server-870738545502.us-central1.run.app/mcp
EOF
fi

if [ ! -f requirements.txt ]; then
  echo "Creating requirements.txt..."
  cat <<EOF > requirements.txt
google-adk==1.14.0
langchain-community==0.3.27
wikipedia==1.4.0
EOF
fi
if [ ! -f __init__.py ]; then
  echo "Creating __init__.py..."
  cat <<EOF > __init__.py
from . import agent
EOF
fi

# Deployment
echo "Deploying..."
cd ~/zoo_guide_agent

echo "Running adk deploy..."
# We use yes to blindly accept prompts if echo -e fails? No, echo -e "Y\ny" is safer.
echo -e "Y\ny" | uvx --from google-adk adk deploy cloud_run \
  --project=$PROJECT_ID \
  --region=us-central1 \
  --service_name=zoo-tour-guide \
  --with_ui \
  . \
  -- \
  --labels=dev-tutorial=codelab-adk \
  --service-account=${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com
