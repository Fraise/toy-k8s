# install istio
istioctl install --set profile=ambient --skip-confirmation
kubectl apply -f cluster/k8s-gateway-api.yaml

#setup ambient mode & waypoint proxy
kubectl label namespace default istio.io/dataplane-mode=ambient
istioctl waypoint apply -n default --enroll-namespace

# Also enroll the rest of the network stuff in the mesh
#kubectl label namespace ingress-nginx istio.io/dataplane-mode=ambient
#istioctl waypoint apply -n ingress-nginx --enroll-namespace
#
#kubectl label namespace kube-system istio.io/dataplane-mode=ambient
#istioctl waypoint apply -n kube-system --enroll-namespace

#visualisation and metrics
kubectl apply -f cluster/prometheus.yaml
kubectl apply -f cluster/kiali.yaml