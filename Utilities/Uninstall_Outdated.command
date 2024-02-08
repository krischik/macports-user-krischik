#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 94920 $
#   $Date: 2012-07-02 14:29:54 +0200 (Mo, 02. Jul 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Uninstall_KDE4.command $
############################################################## }}}1 ##########

setopt No_XTrace
setopt No_Err_Exit

function Uninstall_GEM ()
{
    local in_GEM="${1}"

    ${in_GEM} uninstall --all --force steem-ruby radiator aws-eventstream aws-partitions aws-sdk aws-sdk-accessanalyzer aws-sdk-account aws-sdk-acm aws-sdk-acmpca aws-sdk-alexaforbusiness aws-sdk-amplify aws-sdk-amplifybackend aws-sdk-amplifyuibuilder aws-sdk-apigateway aws-sdk-apigatewaymanagementapi aws-sdk-apigatewayv2 aws-sdk-appconfig aws-sdk-appconfigdata aws-sdk-appfabric aws-sdk-appflow aws-sdk-appintegrationsservice aws-sdk-applicationautoscaling aws-sdk-applicationcostprofiler aws-sdk-applicationdiscoveryservice aws-sdk-applicationinsights aws-sdk-appmesh aws-sdk-appregistry aws-sdk-apprunner aws-sdk-appstream aws-sdk-appsync aws-sdk-arczonalshift aws-sdk-athena aws-sdk-auditmanager aws-sdk-augmentedairuntime aws-sdk-autoscaling aws-sdk-autoscalingplans aws-sdk-backup aws-sdk-backupgateway aws-sdk-backupstorage aws-sdk-batch aws-sdk-billingconductor aws-sdk-braket aws-sdk-budgets aws-sdk-chime aws-sdk-chimesdkidentity aws-sdk-chimesdkmediapipelines aws-sdk-chimesdkmeetings aws-sdk-chimesdkmessaging aws-sdk-chimesdkvoice aws-sdk-cleanrooms aws-sdk-cloud9 aws-sdk-cloudcontrolapi aws-sdk-clouddirectory aws-sdk-cloudformation aws-sdk-cloudfront aws-sdk-cloudhsm aws-sdk-cloudhsmv2 aws-sdk-cloudsearch aws-sdk-cloudsearchdomain aws-sdk-cloudtrail aws-sdk-cloudtraildata aws-sdk-cloudwatch aws-sdk-cloudwatchevents aws-sdk-cloudwatchevidently aws-sdk-cloudwatchlogs aws-sdk-cloudwatchrum aws-sdk-codeartifact aws-sdk-codebuild aws-sdk-codecatalyst aws-sdk-codecommit aws-sdk-codedeploy aws-sdk-codeguruprofiler aws-sdk-codegurureviewer aws-sdk-codegurusecurity aws-sdk-codepipeline aws-sdk-codestar aws-sdk-codestarconnections aws-sdk-codestarnotifications aws-sdk-cognitoidentity aws-sdk-cognitoidentityprovider aws-sdk-cognitosync aws-sdk-comprehend aws-sdk-comprehendmedical aws-sdk-computeoptimizer aws-sdk-configservice aws-sdk-connect aws-sdk-connectcampaignservice aws-sdk-connectcases aws-sdk-connectcontactlens aws-sdk-connectparticipant aws-sdk-connectwisdomservice aws-sdk-controltower aws-sdk-core aws-sdk-costandusagereportservice aws-sdk-costexplorer aws-sdk-customerprofiles aws-sdk-databasemigrationservice aws-sdk-dataexchange aws-sdk-datapipeline aws-sdk-datasync aws-sdk-dax aws-sdk-detective aws-sdk-devicefarm aws-sdk-devopsguru aws-sdk-directconnect aws-sdk-directoryservice aws-sdk-dlm aws-sdk-docdb aws-sdk-docdbelastic aws-sdk-drs aws-sdk-dynamodb aws-sdk-dynamodbstreams aws-sdk-ebs aws-sdk-ec2 aws-sdk-ec2instanceconnect aws-sdk-ecr aws-sdk-ecrpublic aws-sdk-ecs aws-sdk-efs aws-sdk-eks aws-sdk-elasticache aws-sdk-elasticbeanstalk aws-sdk-elasticinference aws-sdk-elasticloadbalancing aws-sdk-elasticloadbalancingv2 aws-sdk-elasticsearchservice aws-sdk-elastictranscoder aws-sdk-emr aws-sdk-emrcontainers aws-sdk-emrserverless aws-sdk-entityresolution aws-sdk-eventbridge aws-sdk-finspace aws-sdk-finspacedata aws-sdk-firehose aws-sdk-fis aws-sdk-fms aws-sdk-forecastqueryservice aws-sdk-forecastservice aws-sdk-frauddetector aws-sdk-fsx aws-sdk-gamelift aws-sdk-gamesparks aws-sdk-glacier aws-sdk-globalaccelerator aws-sdk-glue aws-sdk-gluedatabrew aws-sdk-greengrass aws-sdk-greengrassv2 aws-sdk-groundstation aws-sdk-guardduty aws-sdk-health aws-sdk-healthlake aws-sdk-honeycode aws-sdk-iam aws-sdk-identitystore aws-sdk-imagebuilder aws-sdk-importexport aws-sdk-inspector aws-sdk-inspector2 aws-sdk-internetmonitor aws-sdk-iot aws-sdk-iot1clickdevicesservice aws-sdk-iot1clickprojects aws-sdk-iotanalytics aws-sdk-iotdataplane aws-sdk-iotdeviceadvisor aws-sdk-iotevents aws-sdk-ioteventsdata aws-sdk-iotfleethub aws-sdk-iotfleetwise aws-sdk-iotjobsdataplane aws-sdk-iotroborunner aws-sdk-iotsecuretunneling aws-sdk-iotsitewise aws-sdk-iotthingsgraph aws-sdk-iottwinmaker aws-sdk-iotwireless aws-sdk-ivs aws-sdk-ivschat aws-sdk-ivsrealtime aws-sdk-kafka aws-sdk-kafkaconnect aws-sdk-kendra aws-sdk-kendraranking aws-sdk-keyspaces aws-sdk-kinesis aws-sdk-kinesisanalytics aws-sdk-kinesisanalyticsv2 aws-sdk-kinesisvideo aws-sdk-kinesisvideoarchivedmedia aws-sdk-kinesisvideomedia aws-sdk-kinesisvideosignalingchannels aws-sdk-kinesisvideowebrtcstorage aws-sdk-kms aws-sdk-lakeformation aws-sdk-lambda aws-sdk-lambdapreview aws-sdk-lex aws-sdk-lexmodelbuildingservice aws-sdk-lexmodelsv2 aws-sdk-lexruntimev2 aws-sdk-licensemanager aws-sdk-licensemanagerlinuxsubscriptions aws-sdk-licensemanagerusersubscriptions aws-sdk-lightsail aws-sdk-locationservice aws-sdk-lookoutequipment aws-sdk-lookoutforvision aws-sdk-lookoutmetrics aws-sdk-machinelearning aws-sdk-macie aws-sdk-macie2 aws-sdk-mainframemodernization aws-sdk-managedblockchain aws-sdk-managedblockchainquery aws-sdk-managedgrafana aws-sdk-marketplacecatalog aws-sdk-marketplacecommerceanalytics aws-sdk-marketplaceentitlementservice aws-sdk-marketplacemetering aws-sdk-mediaconnect aws-sdk-mediaconvert aws-sdk-medialive aws-sdk-mediapackage aws-sdk-mediapackagev2 aws-sdk-mediapackagevod aws-sdk-mediastore aws-sdk-mediastoredata aws-sdk-mediatailor aws-sdk-medicalimaging aws-sdk-memorydb aws-sdk-mgn aws-sdk-migrationhub aws-sdk-migrationhubconfig aws-sdk-migrationhuborchestrator aws-sdk-migrationhubrefactorspaces aws-sdk-migrationhubstrategyrecommendations aws-sdk-mobile aws-sdk-mq aws-sdk-mturk aws-sdk-mwaa aws-sdk-neptune aws-sdk-neptunedata aws-sdk-networkfirewall aws-sdk-networkmanager aws-sdk-nimblestudio aws-sdk-oam aws-sdk-omics aws-sdk-opensearchserverless aws-sdk-opensearchservice aws-sdk-opsworks aws-sdk-opsworkscm aws-sdk-organizations aws-sdk-osis aws-sdk-outposts aws-sdk-panorama aws-sdk-paymentcryptography aws-sdk-paymentcryptographydata aws-sdk-pcaconnectorad aws-sdk-personalize aws-sdk-personalizeevents aws-sdk-personalizeruntime aws-sdk-pi aws-sdk-pinpoint aws-sdk-pinpointemail aws-sdk-pinpointsmsvoice aws-sdk-pinpointsmsvoicev2 aws-sdk-pipes aws-sdk-polly aws-sdk-pricing aws-sdk-privatenetworks aws-sdk-prometheusservice aws-sdk-proton aws-sdk-qldb aws-sdk-qldbsession aws-sdk-quicksight aws-sdk-ram aws-sdk-rds aws-sdk-rdsdataservice aws-sdk-recyclebin aws-sdk-redshift aws-sdk-redshiftdataapiservice aws-sdk-redshiftserverless aws-sdk-rekognition aws-sdk-resiliencehub aws-sdk-resourceexplorer2 aws-sdk-resourcegroups aws-sdk-resourcegroupstaggingapi aws-sdk-resources aws-sdk-robomaker aws-sdk-rolesanywhere aws-sdk-route53 aws-sdk-route53domains aws-sdk-route53recoverycluster aws-sdk-route53recoverycontrolconfig aws-sdk-route53recoveryreadiness aws-sdk-route53resolver aws-sdk-s3 aws-sdk-s3control aws-sdk-s3outposts aws-sdk-sagemaker aws-sdk-sagemakeredgemanager aws-sdk-sagemakerfeaturestoreruntime aws-sdk-sagemakergeospatial aws-sdk-sagemakermetrics aws-sdk-sagemakerruntime aws-sdk-savingsplans aws-sdk-scheduler aws-sdk-schemas aws-sdk-secretsmanager aws-sdk-securityhub aws-sdk-securitylake aws-sdk-serverlessapplicationrepository aws-sdk-servicecatalog aws-sdk-servicediscovery aws-sdk-servicequotas aws-sdk-ses aws-sdk-sesv2 aws-sdk-shield aws-sdk-signer aws-sdk-simpledb aws-sdk-simspaceweaver aws-sdk-sms aws-sdk-snowball aws-sdk-snowdevicemanagement aws-sdk-sns aws-sdk-sqs aws-sdk-ssm aws-sdk-ssmcontacts aws-sdk-ssmincidents aws-sdk-ssmsap aws-sdk-ssoadmin aws-sdk-ssooidc aws-sdk-states aws-sdk-storagegateway aws-sdk-support aws-sdk-supportapp aws-sdk-swf aws-sdk-synthetics aws-sdk-textract aws-sdk-timestreamquery aws-sdk-timestreamwrite aws-sdk-tnb aws-sdk-transcribeservice aws-sdk-transcribestreamingservice aws-sdk-transfer aws-sdk-translate aws-sdk-verifiedpermissions aws-sdk-voiceid aws-sdk-vpclattice aws-sdk-waf aws-sdk-wafregional aws-sdk-wafv2 aws-sdk-wellarchitected aws-sdk-workdocs aws-sdk-worklink aws-sdk-workmail aws-sdk-workmailmessageflow aws-sdk-workspaces aws-sdk-workspacesweb aws-sdk-xray aws-sigv2 aws-sigv4 
}

if test "${USER}" = "root"; then
    for I in				\
	"antenna"			\
	"apache2"			\
	"ctags"				\
	"docker"			\
	"ext4fuse"	    		\
	"fontforge"			\
	"gcc6"				\
	"gcc8"				\
	"gimp-app"			\
	"git"				\
	"git-crypt"			\
	"git-cvs"			\
	"git-extras"			\
	"git-flow"			\
	"git-flow-bash-completion"	\
	"git-lfs"			\
	"GitX"				\
	"gsed"				\
	"llvm-3.7"			\
	"llvm-3.9"			\
	"macfuse"	    		\
	"maven3"			\
	"maven31"			\
	"maven32"			\
	"maven_select"			\
	"microemu"			\
	"openjdk11"			\
	"osxfuse"	    		\
	"python27"			\
	"rsync"				\
	"scala2.11"			\
	"scala2.11-docs"		\
	"scala2.12"			\
	"scala2.12-docs"		\
	"scala_select"			\
	"sitecopy"			\
	"VeraCrypt"	    		\
	"yasm"
    do
	echo "uninstall ${=I}"
	port uninstall --follow-dependents ${=I}
    done; unset I

    for I in				\
	"ruby25"			\
	"ruby26"			\
	"ruby27"
    do
	Uninstall_GEM ${I}
    done; unset I
else
    setopt Multi_OS

    sudo ${0} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    for I in		    \
	"imapfilter"	    \
	"openjdk"	    \
	"osxfuse"
    do
	echo "uninstall ${=I}"
	brew uninstall --ignore-dependencies ${=I}
    done; unset I
fi

############################################################ {{{1 ###########
# vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
