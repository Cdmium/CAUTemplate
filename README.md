# CAUTemplate
China Agricultural University Course Thesis LaTeX Template
中国农业大学课程论文模板
## 功能
 - 自动生成中国农业大学课程论文封面
 - 自动填入封面信息或生成指定空白行
 - 自动生成目录
 - 自动控制格式
 - 使用bibLaTeX生成参考文献
 - 定义两个层次enumerate环境
## 说明
 - 编译中文需要使用XeLaTeX进行编译，参考文献使用biber(BibLaTeX)进行编译，推荐编译链为XeLaTeX -> biber -> XeLaTeX*2
 - 推荐使用最新的TeX Live套件，或者MiKTex套件。cTeX套件多年未进行更新，其中的ctex宏包版本过老，没有\zihao{}指令，无法使用此模板。
 - 默认使用思源字体（Noto）与方正字体，对字体有需要的请自行.cls文件中更改
