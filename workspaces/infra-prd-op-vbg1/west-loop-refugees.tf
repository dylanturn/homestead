resource "kubernetes_namespace" "wlr_namespace" {
  metadata {
    name = "wlr"
  }
}

module "wlr_argo_project" {
  source = "git@github.com:project-octal/terraform-argocd-project.git?ref=v1.0.1"

  argocd_namespace = "kube-argocd"

  name        = "west-loop-refugees"
  description = "An ArgoCD Project for a West Loop Refugees deployments"
  source_repos = [
    "*"
  ]

  cluster_resource_whitelist = [
    {
      kind  = "*"
      group = "*"
    }
  ]

  namespace_resource_whitelist = [
    {
      kind  = "*"
      group = "*"
    }
  ]

  destinations = [
    {
      server    = "https://kubernetes.default.svc"
      namespace = kubernetes_namespace.wlr_namespace.metadata.0.name
    },
    {
      server    = "https://kubernetes.default.svc"
      namespace = "jitsi"
    },
    {
      server    = "https://kubernetes.default.svc"
      namespace = "wlr-*"
    }
  ]
  permissions = [
    {
      name        = "read"
      description = "Grants read permissions to the configured OIDC group."
      oidc_groups = [
        "wlr-read-only"
      ]
      policies = [
        {
          resource = "applications"
          action   = "list"
          object   = "*"
        },
        {
          resource = "applications"
          action   = "get"
          object   = "*"
        }
      ]
    },
    {
      name        = "write"
      description = "Grants write permissions to the configured OIDC group."
      oidc_groups = [
        "wlr-write-only"
      ]
      policies = [
        {
          resource = "applications"
          action   = "create"
          object   = "*"
        },
        {
          resource = "applications"
          action   = "delete"
          object   = "*"
        }
      ]
    }
  ]
}