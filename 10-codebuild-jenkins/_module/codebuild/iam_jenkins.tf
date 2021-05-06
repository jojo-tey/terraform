# Jenkins User
resource "aws_iam_user" "jenkins_codebuild" {
  name = "jenkins-codebuild"
}

# Permissions that jenkins needs to create codebuild job
# You can change s3 bucket below if you have any bucket that jenkins use for retrieving/uploading artifact
resource "aws_iam_user_policy" "jenkins_codebuild" {
  name   = "jenkins-codebuild"
  user   = aws_iam_user.jenkins_codebuild.name
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Resource": ["arn:aws:logs:*:*:log-group:/aws/codebuild/*"],
            "Action": ["logs:GetLogEvents"]
        },
        {
            "Effect": "Allow",
            "Resource": ["arn:aws:s3:::art-deploy"],
            "Action": ["s3:GetBucketVersioning"]
        },
        {
            "Effect": "Allow",
            "Resource": ["arn:aws:s3:::art-deploy/*"],
            "Action": ["s3:PutObject"]
        },
        {
            "Effect": "Allow",
            "Resource": ["arn:aws:s3:::art-deploy/*"],
            "Action": ["s3:GetObject"]
        },
        {
            "Effect": "Allow",
            "Resource": ["arn:aws:codebuild:*:*:*"],
            "Action": [
                "codebuild:StartBuild",
                "codebuild:BatchGetBuilds",
                "codebuild:BatchGetProjects",
                "codebuild:StopBuild"
            ]
        }
	]
  }
EOF

}
