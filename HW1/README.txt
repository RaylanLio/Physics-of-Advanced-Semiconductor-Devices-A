main.m 是主程序，运行后会生成简化能带图和完整能带图；
KPModel.m（可以不用管） 是 Kronig-Penney 模型函数，其输入变量为T、a、b、U0、E，所有都是从 Parameter_KPModel.mat 提取出来的参数，E 是试验能量范围；其输出为 E（允带能量、波矢、能量编号） 
Parameter_KPModel.m 是设置 Kronig-Penney 模型参数，当中 m0 是粒子质量，hbar 是约化普朗克常数（单位是 eV * s），q 是单位正电荷的电荷量，d 是晶格常数（单位是A，默认为硅的晶格常数 5.43A），b 是势垒宽度，U0 是势垒高度（单位是 eV，默认为 5eV），dE 是试验能量增量。
BandStructurePlot.m （可以不用管）是画出 E-k 图的函数，输入为 k（波矢）、E（允带能量）、a、b 和 figtitle（图题）。