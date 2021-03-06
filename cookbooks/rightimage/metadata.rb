maintainer       "RightScale, Inc."
maintainer_email "support@rightscale.com"
description      "image building tools"
version          "0.0.1"

recipe "rightimage::default", "build image based on host platform" 
recipe "rightimage::clean", "cleans everything" 
recipe "rightimage::do_ubuntu", "coordinate an ubuntu install" 
recipe "rightimage::do_centos", "coordinate a centos install" 
recipe "rightimage::do_sles", "coordinate a sles install" 
recipe "rightimage::bootstrap_ubuntu", "bootstraps a basic ubuntu image" 
recipe "rightimage::bootstrap_centos", "bootstraps a basic centos image" 
recipe "rightimage::bootstrap_sles", "bootstraps a basic sles image" 
recipe "rightimage::install_rightscale", "installs rightscale"
recipe "rightimage::do_ec2", "migrates the created image to ec2"
recipe "rightimage::do_euca", "migrates the created image to eucalyptus" 
recipe "rightimage::do_vmops", "migrates the created image to cloud.com" 
recipe "rightimage::install_vhd-util", "install the vhd-util tool"

attribute "rest_connection/user",
  :display_name => "rightscale email",
  :description => "your email address @rightscale",
  :required => true

attribute "rest_connection/pass",
  :display_name => "rightscale pass",
  :description => "your password",
  :required => true
 
attribute "rest_connection/api_url",
  :display_name => "the rightscale account specific api url to use",
  :description => "eg. https://my.rightscale.com/api/acct/1234 (where 1234 is your account id)",
  :required => true


#
# required
#
attribute "rightimage/platform",
  :display_name => "platform",
  :description => "the os of the image to build",
  :required => true
  
attribute "rightimage/release",
  :display_name => "release",
  :description => "the release of the image to build",
  :required => true,
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_ubuntu" , "rightimage::do_sles" , "rightimage::default" , "rightimage::do_vmops" ]
  
attribute "rightimage/arch",
  :display_name => "arch",
  :description => "the arch of the image to build",
  :required => true
  
attribute "rightimage/cloud",
  :display_name => "cloud",
  :description => "the cloud that the image will reside",
  :required => true
  
attribute "rightimage/region",
  :display_name => "region",
  :description => "the region that the image will reside",
  :required => true
  
attribute "rightimage/git_repo",
  :display_name => "git_repo",
  :description => "the git repo to checkout to build rightscale",
  :required => true
  
attribute "rightimage/rightscale_release",
  :display_name => "rightscale_release",
  :description => "the rightscale release of the image",
  :required => true
  
attribute "rightimage/image_upload_bucket",
  :display_name => "image_upload_bucket",
  :description => "the bucket to upload the image to",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_ubuntu" , "rightimage::do_sles" , "rightimage::default" , "rightimage::do_vmops" ]
  
attribute "rightimage/image_prefix",
  :display_name => "image_prefix",
  :description => "an optional prefix for the image name",
  :required => "optional",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_ubuntu" , "rightimage::do_sles" , "rightimage::default" , "rightimage::do_vmops" ]
  
attribute "rightimage/image_postfix",
  :display_name => "image_postfix",
  :description => "an optional postfix for the image name",
  :required => "optional",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_ubuntu" , "rightimage::do_sles" , "rightimage::default" , "rightimage::do_vmops" ]
  
attribute "rightimage/image_name_override",
  :display_name => "Image Name Override",
  :description => "The image name is created automaticaaly.  Set this value if you want to override the default image name.",
  :required => "optional",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2", "rightimage::default" , "rightimage::do_vmops" ]
  
attribute "rightimage/aws_account_number",
  :display_name => "aws_account_number",
  :description => "aws_account_number",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_ubuntu" , "rightimage::do_sles" , "rightimage::default" , "rightimage::do_vmops" ]
  
attribute "rightimage/aws_access_key_id",
  :display_name => "aws_access_key_id",
  :description => "aws_access_key_id",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_ubuntu" , "rightimage::do_sles" , "rightimage::default" , "rightimage::do_vmops" , "rightimage::do_vmops" ]
  
attribute "rightimage/aws_secret_access_key",
  :display_name => "aws_secret_access_key",
  :description => "aws_secret_access_key",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_sles" , "rightimage::do_ubuntu" , "rightimage::default" , "rightimage::do_vmops" , "rightimage::do_vmops" ]
  
attribute "rightimage/aws_509_key",
  :display_name => "aws_509_key",
  :description => "aws_509_key",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_sles" , "rightimage::do_ubuntu" , "rightimage::default" , "rightimage::do_vmops" ]
  
attribute "rightimage/aws_509_cert",
  :display_name => "aws_509_cert",
  :description => "aws_509_cert",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_sles" , "rightimage::do_ubuntu" , "rightimage::default" , "rightimage::do_vmops" ]
 
attribute "rightimage/aws_access_key_id_for_upload",
  :display_name => "aws_access_key_id_for_upload",
  :description => "aws_access_key_id for the uplaod bucket",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_sles" , "rightimage::do_ubuntu" , "rightimage::default" , "rightimage::do_vmops" ]
  
attribute "rightimage/aws_secret_access_key_for_upload",
  :display_name => "aws_secret_access_key_for_upload",
  :description => "aws_secret_access_key_for_upload",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ,"rightimage::do_ec2" , "rightimage::do_centos" , "rightimage::do_sles" , "rightimage::do_ubuntu" , "rightimage::default" , "rightimage::do_vmops" ]


attribute "rightimage/debug",
  :display_name => "debug",
  :description => "toggles debug mode",
  :required => "optional",
  :recipes => [ "rightimage::do_centos" , "rightimage::do_sles" , "rightimage::do_ubuntu" , "rightimage::default" , "rightimage::bootstrap_centos" , "rightimage::bootstrap_sles" , "rightimage::bootstrap_ubuntu" ]


## euca inputs  
attribute "rightimage/euca/user",
  :display_name => "euca user",
  :description => "euca user",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]
  
attribute "rightimage/euca/walrus_url",
  :display_name => "walrus url",
  :description => "walrus url",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

attribute "rightimage/euca/euca_url",
  :display_name => "euca url",
  :description => "euca url",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

attribute "rightimage/euca/access_key_id",
  :display_name => "access key id",
  :description => "access key id",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

attribute "rightimage/euca/secret_access_key",
  :display_name => "secret access key",
  :description => "secret access key",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

attribute "rightimage/euca/user_admin",
  :display_name => "euca user admin",
  :description => "euca user for the admin acct",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]
  
attribute "rightimage/euca/access_key_id_admin",
  :display_name => "access key id admin acct",
  :description => "access key id for admin acct",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

attribute "rightimage/euca/secret_access_key_admin",
  :display_name => "secret access key admin",
  :description => "secret access key for the admin acct",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

attribute "rightimage/euca/x509_key_admin",
  :display_name => "x509 key admin",
  :description => "x509 key for the admin acct",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

attribute "rightimage/euca/x509_cert_admin",
  :display_name => "x509 cert admin",
  :description => "x509 cert for the admin acct",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

attribute "rightimage/euca/x509_key",
  :display_name => "x509 key ",
  :description => "x509 key ",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

attribute "rightimage/euca/x509_cert",
  :display_name => "x509 cert ",
  :description => "x509 cert ",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

attribute "rightimage/euca/euca_cert",
  :display_name => "euca cert",
  :description => "euca cert",
  :required => "required",
  :recipes => [ "rightimage::do_euca" ]

