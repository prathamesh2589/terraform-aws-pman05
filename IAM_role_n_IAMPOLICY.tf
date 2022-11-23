
#creating IAM policy and add JSON for s3 readonly
resource "aws_iam_role_policy" "ec2_policy_pman" {
  name = "ec2_policy_pman"
  role = aws_iam_role.ec2_role_pman.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:Get*",
          "s3:List*",
          "s3-object-lambda:Get*",
          "s3-object-lambda:List*"
        ],
        "Resource" : "*"
      }
    ]
  })
}

#creating IAM role
resource "aws_iam_role" "ec2_role_pman" {
  name = "ec2_role_pman"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "ec2.amazonaws.com"
          ]
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile_pman" {
  name = "ec2_profile_pman"
  role = aws_iam_role.ec2_role_pman.name
}