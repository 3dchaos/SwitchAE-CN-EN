@echo off
setlocal

:: �����ļ���
set chinese_file=application����.xml
set english_file=applicationӢ��.xml
set default_file=application.xml

:: ����Ƿ���� "application����.xml"
if exist "%chinese_file%" (
    echo �л�Ϊ���İ�
    :: ����ҵ� "application����.xml"�������� "application.xml" Ϊ "applicationӢ��.xml"
    if exist "%default_file%" (
        rename "%default_file%" "%english_file%"
    )
    :: Ȼ�� "application����.xml" ������Ϊ "application.xml"
    rename "%chinese_file%" "%default_file%"
) else (
    echo �л�ΪӢ�İ�
    :: ���û�ҵ� "application����.xml"�������� "application.xml" Ϊ "application����.xml"
    if exist "%default_file%" (
        rename "%default_file%" "%chinese_file%"
    )
    :: ���� "applicationӢ��.xml" ������Ϊ "application.xml"
    if exist "%english_file%" (
        rename "%english_file%" "%default_file%"
    )
)


:: ��ʾ�û����ո������
echo �ļ�������ɣ��밴�ո���������� AfterFX.exe...
pause >nul

:: �л�����һ��Ŀ¼���������� AfterFX.exe
cd ..
if exist "AfterFX.exe" (
    start "" "AfterFX.exe"
) else (
    echo AfterFX.exe δ�ҵ�
)

:: ����������ű����ر� CMD ����
exit