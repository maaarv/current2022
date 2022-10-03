terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.6.0"
    }
  }
}

provider "confluent" {
  cloud_api_key    = var.confluent_cloud_api_key
  cloud_api_secret = var.confluent_cloud_api_secret
}

resource "confluent_environment" "demo" {
  display_name = "TeamCollaborationDemo"
}

# Update the config to use a cloud provider and region of your choice.
# https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_kafka_cluster
resource "confluent_kafka_cluster" "standard" {
  display_name = "demo"
  availability = "SINGLE_ZONE"
  cloud        = "AWS"
  region       = "eu-central-1"
  standard {}
  environment {
    id = confluent_environment.demo.id
  }
}


data "confluent_user" "teamA_owner" {
  email = "mberindetampanariu+teama_owner@confluent.io"
}

data "confluent_user" "teamA_developer" {
  email = "mberindetampanariu+teama_developer@confluent.io"
}

data "confluent_user" "teamB_owner" {
  email = "mberindetampanariu+teamb_owner@confluent.io"
}

data "confluent_user" "teamB_developer" {
  email = "mberindetampanariu+teamb_developer@confluent.io"
}

resource "confluent_role_binding" "teamA_owner_resourceOwner1" {
  principal   = "User:${data.confluent_user.teamA_owner.id}"
  role_name   = "ResourceOwner"
  crn_pattern = "${confluent_kafka_cluster.standard.rbac_crn}/kafka=${confluent_kafka_cluster.standard.id}/topic=${confluent_kafka_topic.teamA_topic1.topic_name}"
}

resource "confluent_role_binding" "teamA_owner_resourceOwner2" {
  principal   = "User:${data.confluent_user.teamA_owner.id}"
  role_name   = "ResourceOwner"
  crn_pattern = "${confluent_kafka_cluster.standard.rbac_crn}/kafka=${confluent_kafka_cluster.standard.id}/topic=${confluent_kafka_topic.teamA_topic2.topic_name}"
}

resource "confluent_role_binding" "teamA_developer1" {
  principal   = "User:${data.confluent_user.teamA_developer.id}"
  role_name   = "DeveloperRead"
  crn_pattern = "${confluent_kafka_cluster.standard.rbac_crn}/kafka=${confluent_kafka_cluster.standard.id}/topic=${confluent_kafka_topic.teamA_topic1.topic_name}"
}

resource "confluent_role_binding" "teamA_developer2" {
  principal   = "User:${data.confluent_user.teamA_developer.id}"
  role_name   = "DeveloperRead"
  crn_pattern = "${confluent_kafka_cluster.standard.rbac_crn}/kafka=${confluent_kafka_cluster.standard.id}/topic=${confluent_kafka_topic.teamA_topic2.topic_name}"
}


resource "confluent_role_binding" "teamB_owner_resourceOwner1" {
  principal   = "User:${data.confluent_user.teamB_owner.id}"
  role_name   = "ResourceOwner"
  crn_pattern = "${confluent_kafka_cluster.standard.rbac_crn}/kafka=${confluent_kafka_cluster.standard.id}/topic=${confluent_kafka_topic.teamB_topic1.topic_name}"
}

resource "confluent_role_binding" "teamB_owner_resourceOwner2" {
  principal   = "User:${data.confluent_user.teamB_owner.id}"
  role_name   = "ResourceOwner"
  crn_pattern = "${confluent_kafka_cluster.standard.rbac_crn}/kafka=${confluent_kafka_cluster.standard.id}/topic=${confluent_kafka_topic.teamB_topic2.topic_name}"
}



resource "confluent_role_binding" "teamB_developer1" {
  principal   = "User:${data.confluent_user.teamB_developer.id}"
  role_name   = "DeveloperRead"
  crn_pattern = "${confluent_kafka_cluster.standard.rbac_crn}/kafka=${confluent_kafka_cluster.standard.id}/topic=${confluent_kafka_topic.teamB_topic1.topic_name}"
}

resource "confluent_role_binding" "teamB_developer2" {
  principal   = "User:${data.confluent_user.teamB_developer.id}"
  role_name   = "DeveloperRead"
  crn_pattern = "${confluent_kafka_cluster.standard.rbac_crn}/kafka=${confluent_kafka_cluster.standard.id}/topic=${confluent_kafka_topic.teamB_topic2.topic_name}"
}

//literal assignment from table
/*resource "confluent_role_binding" "teamB_developer3" {
  principal   = "User:${data.confluent_user.teamB_developer.id}"
  role_name   = "DeveloperRead"
  crn_pattern = "${confluent_kafka_cluster.standard.rbac_crn}/kafka=${confluent_kafka_cluster.standard.id}/topic=${confluent_kafka_topic.teamA_topic1.topic_name}"
}*/

resource "confluent_kafka_topic" "teamA_topic1" {
  kafka_cluster {
    id = confluent_kafka_cluster.standard.id
  }
  topic_name    = "TeamA-Topic1"
  rest_endpoint = confluent_kafka_cluster.standard.rest_endpoint
  credentials {
    key    = confluent_api_key.cluster_service_account_kafka_api_key.id
    secret = confluent_api_key.cluster_service_account_kafka_api_key.secret
  }
}

resource "confluent_kafka_topic" "teamA_topic2" {
  kafka_cluster {
    id = confluent_kafka_cluster.standard.id
  }
  topic_name    = "TeamA-Topic2"
  rest_endpoint = confluent_kafka_cluster.standard.rest_endpoint
  credentials {
    key    = confluent_api_key.cluster_service_account_kafka_api_key.id
    secret = confluent_api_key.cluster_service_account_kafka_api_key.secret
  }
}

resource "confluent_kafka_topic" "teamA_topic3" {
  kafka_cluster {
    id = confluent_kafka_cluster.standard.id
  }
  topic_name    = "TeamA-Topic3"
  rest_endpoint = confluent_kafka_cluster.standard.rest_endpoint
  credentials {
    key    = confluent_api_key.cluster_service_account_kafka_api_key.id
    secret = confluent_api_key.cluster_service_account_kafka_api_key.secret
  }
}

resource "confluent_kafka_topic" "teamB_topic1" {
  kafka_cluster {
    id = confluent_kafka_cluster.standard.id
  }
  topic_name    = "TeamB-Topic1"
  rest_endpoint = confluent_kafka_cluster.standard.rest_endpoint
  credentials {
    key    = confluent_api_key.cluster_service_account_kafka_api_key.id
    secret = confluent_api_key.cluster_service_account_kafka_api_key.secret
  }
}

resource "confluent_kafka_topic" "teamB_topic2" {
  kafka_cluster {
    id = confluent_kafka_cluster.standard.id
  }
  topic_name    = "TeamB-Topic2"
  rest_endpoint = confluent_kafka_cluster.standard.rest_endpoint
  credentials {
    key    = confluent_api_key.cluster_service_account_kafka_api_key.id
    secret = confluent_api_key.cluster_service_account_kafka_api_key.secret
  }
}

resource "confluent_service_account" "cluster_service_account" {
  display_name = "demo-cluster-service-account-team-collaboration-demo"
  description  = "Service account to own cluster"
}

resource "confluent_role_binding" "app-manager-kafka-cluster-admin" {
  principal   = "User:${confluent_service_account.cluster_service_account.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.standard.rbac_crn
}

resource "confluent_api_key" "cluster_service_account_kafka_api_key" {
  display_name = "cluster_service_account-kafka-api-key"
  description  = "Kafka API Key that is owned by 'demo-cluster-service-account' service account"
  owner {
    id          = confluent_service_account.cluster_service_account.id
    api_version = confluent_service_account.cluster_service_account.api_version
    kind        = confluent_service_account.cluster_service_account.kind
  }

  managed_resource {
    id          = confluent_kafka_cluster.standard.id
    api_version = confluent_kafka_cluster.standard.api_version
    kind        = confluent_kafka_cluster.standard.kind

    environment {
      id = confluent_environment.demo.id
    }
  }
   depends_on = [
    confluent_role_binding.app-manager-kafka-cluster-admin
  ]
}

// Note that in order to consume from a topic, the principal of the consumer ('teamA-service-account' service account)
// needs to be authorized to perform 'READ' operation on both Topic and Group resources:
resource "confluent_role_binding" "cluster_service_account" {
  principal   = "User:${confluent_service_account.cluster_service_account.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = "${confluent_kafka_cluster.standard.rbac_crn}"
}

