# Team Collaboration in Kafka Clusters @ Current 2022
![Banner](/images/Berinde-Tampanariu-TeamCollaborationInKafkaClusters.jpeg)

## Demos
### Demo 1: Role bindings with Prefixed Rules in Confluent Cloud
- Authentication: Confluent Cloud local users
- Authorization: RBAC prefixed role bindings
- Naming Convention: Team name used as prefix

![Teams and Topics](/images/TeamCollaboration_TeamsAndTopics.png)

### Demo 2: Authentication with Okta

![Teams and Topics](/images/TeamCollaboration_Clients.png)

### Demo 1+2: Teams and Clients - How/When to grant temporary access?

![Teams and Topics](/images/TeamCollaboration_TeamsAndClients.png)

## Documentation Sources
"Kafka: The Definitive Guide, 2nd Edition" by Gwen Shapira, Todd Palino, Rajini Sivaram, Krit Petty was used as a source throughout the different sections of the presentation. ["Kafka: The Definitive Guide, 2nd Edition"](https://www.confluent.io/resources/kafka-the-definitive-guide-v2/) can be downloaded from the Confluent website.

### Authentication

- [Apache Kafka 3.23 Documentation - 7.1 Security Overview](https://kafka.apache.org/33/documentation/#security_overview)
- [Course: Apache Kafka® Security - Kafka Authentication Basics](https://developer.confluent.io/learn-kafka/security/authentication-basics/)
- [Confluent Platform - Authentication Methods Overview](https://docs.confluent.io/platform/current/kafka/overview-authentication-methods.html#authentication-methods-overview)
- [Confluent Cloud - Access Management: Authenticate](https://docs.confluent.io/cloud/current/access-management/authenticate/index.html)
  - [API Keys](https://docs.confluent.io/cloud/current/access-management/authenticate/api-keys/api-keys.html)
  - [OAuth](https://docs.confluent.io/cloud/current/access-management/authenticate/oauth/overview.html)
  - [SSO](https://docs.confluent.io/cloud/current/access-management/authenticate/sso/sso.html)

### Authorization

- [Apache Kafka 3.23 Documentation - 7.4 Authorization and ACLs](https://kafka.apache.org/33/documentation/#security_authz)
- [KIP-11 - Authorization Interface](https://cwiki.apache.org/confluence/display/KAFKA/KIP-11+-+Authorization+Interface)
- [KIP-290: Support for Prefixed ACLs](https://cwiki.apache.org/confluence/display/KAFKA/KIP-290%3A+Support+for+Prefixed+ACLs)
- [Course: Apache Kafka® Security - Authorization](https://developer.confluent.io/learn-kafka/security/authorization/)
- [Confluent Platform and Apache Kafka Compatibility](https://docs.confluent.io/platform/current/installation/versions-interoperability.html#cp-and-apache-ak-compatibility)
- [Confluent Platform 7.2.1 installation /etc/kafka/kraft/README.md](https://www.confluent.io/installation/ )
- [Confluent Platform Security](https://docs.confluent.io/platform/current/security/)
  - [Configuring Confluent Server Authorizer](https://docs.confluent.io/platform/current/security/csa-introduction.html#configuring-csa)
  - [Authorization using Role-Based Access Control](https://docs.confluent.io/platform/current/security/rbac/index.html)
  - [RBAC role use cases](
https://docs.confluent.io/platform/current/security/rbac/rbac-predefined-roles.html#rbac-role-use-cases)
  - [Authorization using centralized ACLs](https://docs.confluent.io/platform/current/security/rbac/authorization-acl-with-mds.html#authorization-using-centralized-acls)
  - [Authorization using ACLs](https://docs.confluent.io/platform/current/kafka/authorization.html#authorization-using-acls)
- [Confluent Cloud - Access management & control](https://docs.confluent.io/cloud/current/access-management/access-control/index.html)
  - [Use Role-Based Access Control (RBAC) in Confluent Cloud](https://docs.confluent.io/cloud/current/access-management/access-control/cloud-rbac.html)
  - [Use Access Control Lists (ACLs) for Confluent Cloud](https://docs.confluent.io/cloud/current/access-management/access-control/acl.html)

### Platform Limits
[Confluent Cloud Features and Limits by Cluster Type](https://docs.confluent.io/cloud/current/clusters/cluster-types.html)

### Client Quotas
- [Apache Kafka Documentation - 4.9 Quotas](https://kafka.apache.org/33/documentation/#design_quotas)
- [Confluent Platform Quotas](https://docs.confluent.io/platform/current/kafka/design.html#quotas)
- [Multi-tenancy and Client Quotas on Confluent Cloud](https://docs.confluent.io/cloud/current/clusters/client-quotas.html#multi-tenancy-and-client-quotas-on-ccloud)

### Monitoring


### Automation
- [Apache Kafka Documentation - Kafka APIs](https://kafka.apache.org/33/documentation/#intro_apis)
- [Confluent Cloud Documentation on Terraform provider](https://docs.confluent.io/cloud/current/get-started/terraform-provider.html)
- [Confluent Cloud Terraform Provider on Hashicorp Terraform Registry](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs)
- [Confluent for Kubernetes](https://docs.confluent.io/operator/2.4.1/overview.html)
- [Confluent Platform - DevOps for Kafka with Kubernetes and GitOps](https://docs.confluent.io/platform/current/tutorials/streaming-ops/overview.html) (including an overview and three case studies)
