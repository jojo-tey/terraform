# Infrastructure_as_code

AWS는 가장 크게 Account별로 독립적인 공간을 제공합니다. 따라서 환경을 구성할 때 가장 완벽하게 독립적인 환경을 구축하는 방법은 환경별로 서로 다른 Account를 사용하는 것입니다. Multi Account를 위해서 AWS에서는 Assume Role, AWS Organization 등 다양한 기능 및 서비스를 제공하고 있습니다. 
예를 들면 실제 기업에서는 아래와 같이 Multi-Account를 구성하실 수 있습니다.
ID
다른 환경에 접속하기 위해 사용자가 로그인하는 계정. 
id 계정으로만 로그인하면 assume role을 활용해서 다른 환경에 손쉽게 접속할 수 있습니다.
Preprod
Production에 적용하기 전에 개발/스테이지/로드테스트 등 다양한 테스트를 진행할 수 있는 계정
Production
실제 서비스 운영을 위한 인프라가 배포되는 계정
Security
보안과 관련된 서비스만 모아서 관리할 수 있는 계정
Log Archive 
로그 수집 및 분석을 위한 계정
이외에도 상황에 맞게 다양한 구성을 하실 수 있습니다.


Workshop 코드는 실제 운영에 활용할 수 있습니다.
본  워크샵에 반영된 코드는 전부 실제 운영되고 있는 코드를 바탕으로 구성되었습니다. 따라서 처음부터 테라폼으로 전체 구성을 시작하고 싶으신 경우에는 워크샵 코드를 자사의 상황에 맞게 조금씩 구성해 나가시면 이후 서비스 운영에 사용하실 수 있습니다.




Infrastructure as Code란?
Infrastructure as Code(IaS)는 용어 그대로 인프라를 코드로서 정의한다는 것을 의미합니다. 보통은 인프라를 만들 수 있도록 콘솔을 제공해주지만, 콘솔을 통해서 생성한 인프라는 형상을 파악하거나 변경사항을 추적하기가 쉽지 않습니다. 
인프라를 코드로 정의하는 이유는 아래와 같습니다.
버전 관리
코드로 문서화 하면 github 툴을 사용해서 버전관리를 할 수 있습니다.
버전 관리를 하면 Update, Rollback이 편리합니다.
새로운 버전을 올릴 때마다 코드 리뷰 등을 통해서 오류점을 함께 찾을 수 있습니다.
인프라 파악 용이
코드를 통해서 전체 인프라의 구성을 체크할 수 있습니다. 
새로운 팀원이 들어왔을 때 정리된 코드를 보면 훨씬 빠르게 인프라 구성을 파악할 수 있습니다.
배포 속도 향상
새로운 서비스를 위한 인프라 구성이 필요할 때 기존의 코드를 활용하여 빠르게 구성할 수 있습니다.
여러 리소스를 동시에 생성할 수 있기 때문에, 수동으로 콘솔에서 생성하는 것보다 훨씬 빠릅니다.
개발 -> 스테이지 -> 운영 순서로 배포가 진행되어야 할 때, 오차없이 동일한 설정으로 구성할 수 있습니다.

Infrastructure as Code Tool
대표적인 IaS 툴로는 Terraform, AWS Cloudformation, Ansible 등이 있습니다. 
Terraform : 서버 인프라를 생성할 수 있도록 도와주는 대표적인 IaS 도구입니다. AWS 말고도 GCP, Azure 등 다양한 Provider를 제공합니다.
AWS Cloudformation : AWS에서 제공하는 서비스 중 하나로, AWS 서비스를 프로비젼할 때 사용하는 IaS 툴입니다.
AWS CDK : AWS CDK(클라우드 개발 키트)는 익숙한 프로그래밍 언어를 사용하여 클라우드 애플리케이션 리소스를 모델링 및 프로비저닝할 수 있는 오픈 소스 소프트웨어 개발 프레임워크입니다.
Ansible : 서버 구성 관리, 어플리케이션 전개를 위한 도구로, 서버에 필요한 패키지 및 어플리케이션 코드 실행 등 서버 구성에 필요한 작업들을 문서로 정리할 수 있습니다. 
이 중에서 서버 인프라를 프로비전할 수 있는 도구 중 대중적으로 유명한 Terraform을 실습할 예정입니다. 테라폼은 Hashicorp 사에서 제공하는 오픈소스로, 많은 사람들이 사용하는만큼 reference도 많습니다.


