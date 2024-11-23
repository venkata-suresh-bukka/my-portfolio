### `Please refer gke_usecase_test.docx file for detailed assignment steps`
# Use Case:

Build and Deploy a react application in GKE, configure Prometheus and Grafana.

## Terraform for Infrastructure.

## Pre-requestees:
1. Install Node – v16.20.2
2. install npm – 8.19.4
3. Install Terraform – v1.9.8
4. Docker
5. gcloud CLI
   
Login to the GCP using below command:

gcloud auth login

Clone the below repo: 
### `https://github.com/venkata-suresh-bukka/my-portfolio.git`

Branch: new-gcp-env

## Deploy IaC via terraform

1.	VPC
2.	Subnet
3.	Firewalls
4.	GKE
5.	Nodepool
   
## Iac Terraform Folder Structure:

![image](https://github.com/user-attachments/assets/cdf9a1a7-584e-4764-96ab-342addf76a9f)

For this use-case modules have been used.

After cloning the repo go-ahead and perform below commands to do the Infra deployment.
•	terraform validate
•	terraform plan
•	terraform apply -auto-approve

Note: My gcp account has antifactory repo already so didn’t included in terraform.

Once deployment is done connect to the gke cluster.

![image](https://github.com/user-attachments/assets/06e4c650-58b1-481a-9279-21a86694213c)

## Image Building and Pushing to Artifact Registry:

Introduction to app:

A portfolio website which is build using react js.

![image](https://github.com/user-attachments/assets/3a8b5e4d-00b9-4c10-9b83-f2b794db9020)

Step 1: 

Go to the main folder where we can find Dockerfile and build the react application docker image.

Command: 

### `docker build -t us-central1-docker.pkg.dev/project-id/repo-name/image-name:v1 .`

![image](https://github.com/user-attachments/assets/3ef62b13-2953-4d8b-b403-7888f14b799e)

Nginx has been used as revers proxy and static files are being served by it.

Dockerfile:

![image](https://github.com/user-attachments/assets/dc3f57df-2c62-4fa3-812f-02f951a6616e)

Step 2: 

Once image is build push it to artifact registry.

Command:

### `docker push us-central1-docker.pkg.dev/<project-id>/repo-name/image-name:v1`

## Deploy Kubernetes manifests:

Pre-requests:

Create a secret in the cluster with permissions to pull images from artifact registry to the cluster.

Command:

### `kubectl create secret docker-registry secret-name \
  ### `--docker-server=us-central1-docker.pkg.dev \`
  ### `--docker-username=_json_key \`
  ### `--docker-password="$(cat <service-account>.json)" `

Step 1:

Apply deployment file with below command.

###  `kubectl apply -f frontend-deployment.yaml`

![image](https://github.com/user-attachments/assets/f9eee186-59c5-4806-8ed1-0a44bcfa5750)

Step 2: 

Create service 

### `kubectl apply -f frontend-service.yaml`  -- type is LoadBalancer 

![image](https://github.com/user-attachments/assets/9fc84597-8da5-442c-9997-358b14907415)

Check the deployment & service with below commands:

### `Kubectl get pods`

![image](https://github.com/user-attachments/assets/3b10d921-8d63-40a4-ae1a-6de840b9785b)

### `Kubectl get svc/services`

![image](https://github.com/user-attachments/assets/2c1e5676-5ed8-4503-97c9-95dac23d9c9c)

Now the app can be accessed via External IP of the Load Balancer

![image](https://github.com/user-attachments/assets/baa8511a-dfcd-4a6c-b7d0-5e75ea71e1e2)

## Deploy Prometheus and Grafana using Helm:

Step 1:

Install Helm 

###  `curl https://get.helm.sh/helm-v3.10.3-linux-amd64.tar.gz -o helm-v3.10.3-linux-md64.tar.gz`
###  `tar -zxvf helm-v3.10.3-linux-amd64.tar.gz`
###  `sudo mv linux-amd64/helm /usr/local/bin/helm`

Reference: https://phoenixnap.com/kb/install-helm

Step 2:

Create a separate namespace for monitoring  

### `kubectl create namespace monitoring`

Add Prometheus, Grafana repos to Helm

### `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`
### `helm repo add grafana https://grafana.github.io/helm-charts`
### `helm repo update`

Run below commands to deploy premetheus and Grafana as services with Type LoadBalancer

### `helm upgrade --install prometheus prometheus-community/prometheus --namespace monitoring -f prom.yaml`
### `helm upgrade --install grafana grafana/grafana --namespace monitoring -f grafana.yaml`

Now check the services availability

### `kubectl get svc prometheus -n monitoring`
### `kubectl get svc grafana -n monitoring`

![image](https://github.com/user-attachments/assets/a6976518-af43-49b5-84f8-dda0d8bb0c25)

Access from browser:

We can get Grafana password from this command

### `kubectl get secret --namespace <namespace-name> grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
Grafana`

After logging go to dashboard and connect to the Prometheus server ip in connection details

![image](https://github.com/user-attachments/assets/3115ca3f-ec8c-426a-a665-cd5ac014682c)

![image](https://github.com/user-attachments/assets/683fb582-c68a-4dea-a781-b593e691e423)

Using sample query “up” in Grafana we see the below info

![image](https://github.com/user-attachments/assets/1ec4242c-16d6-4918-bbf4-a161d2784eaf)

Panel – Pie chart

![image](https://github.com/user-attachments/assets/8206c93b-cdaa-40b1-96de-79743e169557)

Prometheus

![image](https://github.com/user-attachments/assets/5ca82426-1dc5-4b36-be34-29e8245a77d0)

Sample query “up” in Prometheus

![image](https://github.com/user-attachments/assets/403476b9-9380-4035-8450-20c2854a1263)

![image](https://github.com/user-attachments/assets/127ed651-8f09-4112-bf26-184bf4726773)

## Deployment Screenshots in GCP:

![image](https://github.com/user-attachments/assets/123c6243-f321-4c01-9402-0f2a4a20756f)

Node pools

![image](https://github.com/user-attachments/assets/b26f335f-755c-45fe-986d-02343a268ada)

Load Balancers for React app, Grafana and Prometheus

![image](https://github.com/user-attachments/assets/d704a9a1-7493-4cc9-a5c6-d8d1066e097b)

Note: As cost is high for GKE I’ve cleaned the deployment and deployed in cloud run for application sample.

# Cloud Run Deployment
### `https://gcp-portfolio-524836044132.us-central1.run.app/`

# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
