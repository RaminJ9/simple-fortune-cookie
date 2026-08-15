# Takes the cubeconfig secret and decodes it, and then puts it into a file called kubeconfig.
echo "$KUBECONFIG" | base64 -d > kubeconfig

# Uses the kubeconfig file to deploy the Kubernetes manifests to the cluster.
kubectl --kubeconfig kubeconfig apply -f kubernetes/


kubectl --kubeconfig kubeconfig rollout restart deployment backend
kubectl --kubeconfig kubeconfig rollout restart deployment frontend
kubectl --kubeconfig kubeconfig rollout status deployment backend
kubectl --kubeconfig kubeconfig rollout status deployment frontend