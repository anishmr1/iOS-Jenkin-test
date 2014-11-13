xcodebuild -alltargets clean

rm -rf "./JenkinsBuild/*"


xcodebuild -target AVVideoPlayer PROVISIONING_PROFILE="9E4FF9DE-9011-4C6A-ACAF-6C3F62BAFD59" CONFIGURATION_BUILD_DIR=JenkinsBuild

rm -rf "./JenkinsArchive/*"

xcodebuild -scheme AVVideoPlayer archive PROVISIONING_PROFILE="9E4FF9DE-9011-4C6A-ACAF-6C3F62BAFD59" CODE_SIGN_IDENTITY="iPhone Distribution: Whole Foods Market, Inc." -archivePath ./JenkinsArchive/AVVideoPlayer.xcarchive

rm -f "./JenkinsIPAExport/AVVideoPlayer.ipa"

xcodebuild -exportArchive -exportFormat IPA -exportProvisioningProfile "WildCard Distribution" -archivePath ./JenkinsArchive/AVVideoPlayer.xcarchive -exportPath ./JenkinsIPAExport/AVVideoPlayer.ipa

