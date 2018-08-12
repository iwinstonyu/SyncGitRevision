echo off

SetLocal EnableDelayedExpansion

echo ����·��: %cd%
echo �ű�·��: %0
set scriptPath=%~dp0
set scriptPath=.\

echo ��ȡGit�汾��Ϣ
set variable_file=%scriptPath%temp_variable.txt
echo %variable_file%
echo. 2>%variable_file%

git log -1 --pretty=format:"%%D%%n%%H%%n%%ci%%n" >> %variable_file%

set branch_name="NullBranchName"
set commit_hash="NullCommitHash"
set commit_date="NullCommitDate"

set count=1
for /f "tokens=* delims=\n" %%i in (%variable_file%) do (
	if !count! == 1 ( set branch_name="%%i" )
	if !count! == 2 ( set commit_hash=%%i ) 
	if !count! == 3 ( set commit_date=%%i ) 
	set /A count=!count!+1
)

set branch_name=%branch_name: =%
set branch_name=%branch_name:>=%
set branch_name=%branch_name:"=%
set commit_hash=%commit_hash: =%
set commit_date=%commit_date: =%
	
echo ��֧ %branch_name%
echo ��ϣ %commit_hash%
echo ���� %commit_date%

if exist %variable_file% del %variable_file%

echo �������°汾��Ϣ�ļ�
set new_revision_file="%scriptPath%RevisionNew.h"
echo. 2>%new_revision_file%
for /f "tokens=*" %%i in ('type "%scriptPath%RevisionTemp.h"') do (
	set str=%%i
	set str=!str:$SLG_BRANCH_NAME$=%branch_name%!
	set str=!str:$SLG_COMMIT_HASH$=%commit_hash%!
	set str=!str:$SLG_COMMIT_DATE$=%commit_date%!
	echo !str! >>%new_revision_file%
)

echo �Ƚ��¾ɰ汾��Ϣ�ļ�
set old_revision_file=%scriptPath%Revision.h
if not exist %old_revision_file% ( 
	echo �����ھɰ汾��Ϣ�ļ���ֱ�ӿ������ļ�
	copy /Y %new_revision_file% %old_revision_file%
	goto end
)

fc /n %new_revision_file% %old_revision_file%
::
if %errorlevel% == 1 (
	echo �汾�и��£��������ļ�
	copy /Y %new_revision_file% %old_revision_file%
) else if %errorlevel% NEQ 0 (
	echo �Ƚ�ʧ��
) else (
	echo �汾�ļ��Ѿ�������
)

:end
if exist %new_revision_file% del %new_revision_file%