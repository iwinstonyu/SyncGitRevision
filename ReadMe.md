# ����SyncGitRevision
ͨ���ű���Git��ȡ�汾��Ϣ����д�뵽Ԥ�ȶ���ĺꡣ
ͬʱ�����Դ�ļ����ڿ�ִ�г������ϸ��Ϣ��Ҳ�ܿ����汾��Ϣ��
***
<br/>

## ����
1. ��Ӱ汾ģ���ļ�RevisionTemp.h������ļ�Ԥ�ȶ����˰汾��Ϣ�ĺꡣ
�ű���������ģ���ļ�����Revision.h��
2. ������������Դ�ļ�Resource.rc��Ȼ����Resource.rc�������Դversion��
�Ҽ�Resource.rc���鿴���룬���ͷ�ļ���
`#include "Revision.h`
�޸��ļ������Ͳ�Ʒ���ƣ�
`VALUE "FileDescription", SLG_BRANCH_NAME`
`VALUE "ProductName", SLG_COMMIT_HASH`
3. ��Ŀ����Զ������ɲ��裬��PrepareForBuild֮ǰִ�нű�SyncRevision.bat��
4. һ��˳���Ļ���������Revision.h�����������Ԥ����İ汾��Ϣ�ꡣ
�Ҽ����ɵĿ�ִ�г���SyncGitRevision.exe��Ҳ��������ϸ��Ϣ���濴���汾��Ϣ��
***
