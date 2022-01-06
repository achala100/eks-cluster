
#Create EKS cluster roles and policies

resource "aws_iam_role" "eks_cluster" {
  name = "eks_cluster"

  assume_role_policy = <<POLICY
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

#policy attachmentment eks 

resource "aws_iam_policy_attachment" "AmazonEKSClusterPolicy" {
  name = "AmazonEKSClusterPolicy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  roles = aws_iam_role.eks_cluster.name
}

#policy attachmentment ecs

resource "aws_iam_policy_attachment" "AmazonEKSServicePolicy" {
  name       = "AmazonEKSServicePolicy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  roles = aws_iam_role.eks_cluster.name
}




#Create EKS Nodes roles and policies

resource "aws_iam_role" "eks_nodes_group" {
  name = "eks_nodes_group"

  assume_role_policy = <<POLICY
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

#policy attachmentment eks-node-group

resource "aws_iam_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  name       = "AmazonEKSWorkerNodePolicy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  roles = aws_iam_role.eks_cluster.name
}

resource "aws_iam_policy_attachment" "AmazonEKS_CNI_Policy" {
  name       = "AmazonEKS_CNI_Policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  roles = aws_iam_role.eks_cluster.name
}

resource "aws_iam_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  name       = "AmazonEC2ContainerRegistryReadOnly"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  roles = aws_iam_role.eks_cluster.name
}






