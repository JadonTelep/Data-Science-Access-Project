// Subjects
CREATE (s1:Subject { s_name: 'Coding Languages'})
CREATE (s2:Subject { s_name: 'Topics'})

// Coding Languages
CREATE (cl1:CodingLanguage { cl_name: 'Python'})
CREATE (cl2:CodingLanguage { cl_name: 'R'})
CREATE (cl3:CodingLanguage { cl_name: 'SQL'})
CREATE (cl4:CodingLanguage { cl_name: 'HTML'})
CREATE (cl5:CodingLanguage { cl_name: 'XML'})
CREATE (cl6:CodingLanguage { cl_name: 'C'})
CREATE (cl7:CodingLanguage { cl_name: 'C++'})
CREATE (cl8:CodingLanguage { cl_name: 'SAS'})

// Topic
CREATE (t1:Topic { t_name: 'Reading Graphs'})
CREATE (t2:Topic { t_name: 'Least Squares Analysis'})
CREATE (t3:Topic { t_name: 'Linear Models'})
CREATE (t4:Topic { t_name: 'Logistic Models'})
CREATE (t5:Topic { t_name: 'Maximum Likelihood Estimate'})
CREATE (t6:Topic { t_name: 'Reading Graphs'})
CREATE (t7:Topic { t_name: 'Central Limit Theormem'})
CREATE (t8:Topic { t_name: 'Probabilty'})
CREATE (t9:Topic { t_name: 'Probabilty Distributions'})
CREATE (t10:Topic { t_name: 'Uniform Distribution'})
CREATE (t11:Topic { t_name: 'Normal'})
CREATE (t12:Topic { t_name: 'Gamma'})
CREATE (t13:Topic { t_name: 'Exponential'})
CREATE (t14:Topic { t_name: 'Poisson'})
CREATE (t15:Topic { t_name: 'Binomial'})
CREATE (t16:Topic { t_name: 'Geometric'})
CREATE (t17:Topic { t_name: 'Bernoulli'})
CREATE (t18:Topic { t_name: 'Continuous Distributions'})
CREATE (t19:Topic { t_name: 'Discrete Distributions'})
CREATE (t20:Topic { t_name: 'Standard Deviation'})
CREATE (t21:Topic { t_name: 'Variance'})
CREATE (t22:Topic { t_name: 'Mean Median Mode Range'})
CREATE (t23:Topic { t_name: 'Simple Statistics'})
CREATE (t24:Topic { t_name: 'Skew'})
CREATE (t25:Topic { t_name: 'Descriptive Statistics'})
CREATE (t26:Topic { t_name: 'Inferential Statistics'})
CREATE (t27:Topic { t_name: 'Scatter Plot'})
CREATE (t28:Topic { t_name: 'Line Graph'})
CREATE (t29:Topic { t_name: 'Bar Graph'})
CREATE (t30:Topic { t_name: 'Histogram'})
CREATE (t31:Topic { t_name: 'Join Marginal Conditional Probabilites'})
CREATE (t32:Topic { t_name: 'Bayesian Statistics'})
CREATE (t34:Topic { t_name: 'Markov Chain Monte Carlo'})
CREATE (t35:Topic { t_name: 'Time Series'})


// Links from Subjects to Coding Languages
// High-Level Programming Languages 
CREATE (s1)-[:HLP]->(cl1)
// Low-Level Programming Languages
CREATE (s1)-[:LLP]->(cl6)
CREATE (s1)-[:LLP]->(cl7)
// Database Query Languages
CREATE (s1)-[:DQ]->(cl2)
CREATE (s1)-[:DQ]->(cl3)
// Markup Languages
CREATE (s1)-[:MKP]->(cl4)
CREATE (s1)-[:MKP]->(cl5)
// Object-Oriented Programming Languages
CREATE (s1)-[:OOP]->(cl1)
CREATE (s1)-[:OOP]->(cl7)
// Statistics and Database Management
CREATE (s1)-[:SDM]->(cl1)
CREATE (s1)-[:SDM]->(cl2)
CREATE (s1)-[:SDM]->(cl8)