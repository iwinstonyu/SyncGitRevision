# 关于SyncGitRevision
通过脚本从Git获取版本信息，并写入到预先定义的宏。
同时添加资源文件，在可执行程序的详细信息中也能看到版本信息。
***
<br/>

## 步骤
1. 添加版本模板文件RevisionTemp.h。这个文件预先定义了版本信息的宏。
脚本会根据这个模板文件生成Revision.h。
2. 解决方案添加资源文件Resource.rc，然后在Resource.rc上添加资源version。
右键Resource.rc并查看代码，添加头文件：
`#include "Revision.h`
修改文件描述和产品名称：
`VALUE "FileDescription", SLG_BRANCH_NAME`
`VALUE "ProductName", SLG_COMMIT_HASH`
3. 项目添加自定义生成步骤，在PrepareForBuild之前执行脚本SyncRevision.bat。
4. 一切顺利的话，会生成Revision.h，里面包含的预定义的版本信息宏。
右键生成的可执行程序SyncGitRevision.exe，也可以在详细信息里面看到版本信息。
***
