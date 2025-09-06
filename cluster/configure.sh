# install istio
istioctl install --set profile=ambient --skip-confirmation
kubectl apply -f cluster/k8s-gateway-api.yaml

#setup ambient mode & waypoint proxy
kubectl label namespace default istio.io/dataplane-mode=ambient
istioctl waypoint apply -n default --enroll-namespace

#visualisation and metrics
kubectl apply -f cluster/prometheus.yaml
kubectl apply -f cluster/kiali.yaml