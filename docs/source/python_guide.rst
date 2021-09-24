.. _codingstyle:
Python开发规范
=====================================================================

..

  Controlling complexity is the essence of computer programming.  — Brian Kernighan

有些人喜欢动态语言的表达能力和灵活性，有些人却讨厌动态语言，认为动态语言工程不友好，性能低、易出错、难重构。在项目中应该结合不同语言的生产力、性能、生态圈、招聘需求、产品周期等，灵活选取，扬长避短。
动态语言比较适合构建 mvp（最小可用产品），所以很多创业公司后端、内部项目、微服务等在用。以下是笔者从业过程中总结的一些工程实践，因为动态语言本身的特性，需要良好的工程控制保证代码质量，否则将来项目代码仓库可能会失控。
目前网上关于 python 项目工程的资料比较少，以下是笔者的一些实践经验(不局限于Python)，有一定局限性，仅供参考。

分号
--------------------------------------
- 不要在行尾加分号, 也不要用分号将两条命令放在同一行.

行长度
--------------------------------------
- 每行不超过80个字符，例外:1、长的导入模块2、语句注释里的URL
- 不要使用反斜杠连接行
- Python会将圆括号,中括号和花括号中的行隐式的连接起来，你可以利用这个特点。如果需要，你可以在表达式外围增加一对额外的圆括号

::

    Yes: foo_bar(self, width, height, color='black', design=None, x='foo',
             emphasis=None, highlight=0)

         if (width == 0 and height == 0 and
             color == 'red' and emphasis == 'strong'):

- 在注释中，如果必要，将长的URL放在一行上。
::

    Yes:  # See details at
          # http://www.example.com/us/developer/documentation/api/content/v2.0/csv_file_name_extension_full_specification.html
    No:  # See details at
         # http://www.example.com/us/developer/documentation/api/content/\
         # v2.0/csv_file_name_extension_full_specification.html



