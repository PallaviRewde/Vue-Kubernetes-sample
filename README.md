# Complete Setup & Deployment Steps

1. **Clone the repository:**

2. **Install dependencies:**
	```bash
	npm install
	```

3. **Test locally (optional, for development):**
	```bash
	npm run serve
	```
	Open the local URL shown in the terminal (usually http://localhost:8080).

4. **Build the production files:**
	```bash
	npm run build
	```

5. **Build the Docker image (replace `<your-dockerhub-username>` and `<tag>`):**
	```bash
	docker build -t <your-dockerhub-username>/vue-k8s-app:<tag> .
	```

6. **Push the Docker image to Docker Hub:**
	```bash
	docker push <your-dockerhub-username>/vue-k8s-app:<tag>
	```

7. **Update `deployment.yaml` to use your image and tag:**
	```yaml
	image: <your-dockerhub-username>/vue-k8s-app:<tag>
	```

8. **Start Minikube (if not already running):**
	```bash
	minikube start
	```

9. **Deploy to Kubernetes:**
	```bash
	kubectl apply -f deployment.yaml
	kubectl apply -f service.yaml
	```

10. **Check deployment status:**
	 ```bash
	 kubectl rollout status deployment/vue-k8s-app
	 ```

11. **Access the app:**
	 ```bash
	 minikube service <service-name>
	 ```
	 This will open your app in the browser.

     Or, get the service URL:
        ```bash
        kubectl get service