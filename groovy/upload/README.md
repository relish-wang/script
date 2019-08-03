## upload_to_jcenter

- 1 到bintray.com上[注册个人号](https://bintray.com/signup/oss)(千万不要注册组织号)
- 2 点击Add New Repository新建maven仓库(名为maven)
- 3 在你要上传的项目下运行:
```
gpg --gen-key
gpg -a --export relish.wang@gmail.com > public_key_sender.asc
gpg -a --export-secret-key relish.wang@gmail.com > private_key_sender.asc
```
第2、3条命令导出的公钥和私钥，设置到bintray的账号里。

- 4 查看bintray.com上你的账号的apikey
- 5 把你的账号id和apikey设置到项目的local.properties里, 像这样
```groovy
## This file must *NOT* be checked into Version Control Systems,
# as it contains information specific to your local configuration.
#
# Location of the SDK. This is only used by Gradle.
# For customization when using a Version Control System, please read the
# header note.
#Tue Jul 23 10:23:18 CST 2019
ndk.dir=/Users/relish/Library/Android/sdk/ndk-bundle
sdk.dir=/Users/relish/Library/Android/sdk

bintray.user=relish-wang
bintray.apikey=xxxxxxxxxxx
```
- 6 在你(isSingleLibrary?项目的根目录的gradle.properties:library的gradle.properties)中填写上传包的相关信息，像这样:
```groovy
GROUP_ID=wang.relish.widget
ARTIFACT_ID=vehicleedittext # 确保和你新建的package的名字一致(case sensitive)
VERSION_NAME=0.0.1
```
- 7 在library的build.gradle添加一行,:
```groovy
apply from: 'https://raw.githubusercontent.com/relish-wang/script/master/push_to_jcenter.gradle'
```
在根目录的build.gradle中的buildscript节点的dependencies节点里添加:
```groovy
classpath 'com.jfrog.bintray.gradle:gradle-bintray-plugin:1.8.4'
classpath 'com.github.dcendents:android-maven-gradle-plugin:2.1'
```
- 8 执行上传命令(大约要等待20~25min)
```shell
./gradlew clean build library:bintrayUpload
```
- 9 上传成功后, 到bintary上点击“add to jcenter”，然后send，等上一晚上。
其实此时也可以通过在根目录的build.gradle中添加`maven { url "https://dl.bintray.com/relish-wang/maven/" }`来进行依赖
- 10 审核通过后，就可以直接在其他项目中依赖了(当然你根目录的`build.gradle`中需要有jcenter())，像这样:
```groovy
allprojects {
    repositories {
        jcenter() // 当然新建的Android项目默认使用jcenter库
    }
}
```
```groovy
dependencies {
    implementation 'wang.relish.widget:vehicleedittext:0.0.1'
}
```
