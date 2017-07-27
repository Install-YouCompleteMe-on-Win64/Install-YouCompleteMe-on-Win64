安装YouCompleteMe(YCM)全纪录
============================


- [下载所需的软件](#下载所需的软件)
- [安装软件](#安装软件)
  - [安装Visual Studio 2017](#安装visual-studio-2017)
  - [安装Vim](#安装vim)
  - [安装Git](#安装git)
  - [安装curl](#安装curl)
  - [安装Python](#安装python)
  - [安装CMake](#安装cmake)
  - [安装7-zip](#安装7-zip)
- [安装Vundle](#安装vundle)
- [安装YouCompleteMe(YCM)](#安装youcompletemeycm)
  - [下载YCM](#下载ycm)
  - [编译YCM](#编译ycm)
    - [使用脚本自动编译](#使用脚本自动编译)
    - [手动编译](#手动编译)
- [最后的最后](#最后的最后)


下载所需的软件
--------------

安装之前要先准备好一下软件：

- Visual Studio 2017 Community: [官网下载][Visual Studio download]
- Vim: [下载1][vim-win-download] | [下载2][vim-win32-installer-releases]  
  下载1在[YCM][YouCompleteMe#windows]的README中有所提及。建议下载64位的版本。
- Git: [下载1][Git Download 1] | [下载2][Git Download 2]
- curl: [下载页面][curl Download]
- Python: [官网][Python.org] | [官网下载][Python download]  
  Python 2.x或Python 3.x都可以。建议下载64位的版本。
- CMake: [下载页面][CMake Download]
- 7-Zip: [下载页面][7-Zip Download] 
- LLVM: [下载页面][LLVM Download Page]  
  若不需要支持C系语言（C/C++/Objective-C/Objective-C++）的补全，可以不下载。若需要，下载合适的二进制文件。

下载好的文件：

![installations](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/installations.png)


安装软件
--------

假定计算机上还没安装上述提到的软件。下面开始安装上一个步骤下载的软件。

### 安装Visual Studio 2017

如图所示一步一步安装：

![vs_install00](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/vs-install/vs_install00.png)
![vs_install01](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/vs-install/vs_install01.png)
![vs_install02](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/vs-install/vs_install02.png)
![vs_install03_waiting](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/vs-install/vs_install03_waiting.png)
![vs_install04](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/vs-install/vs_install04.png)

安装Visual Studio一般要好久。等待过程中别闲着，安装其他软件。


### 安装Vim

![vim-install.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/vim-install.gif)

安装完成后，查看所安装的Vim是否支持YCM。输入命令`:version`。

可以从下图看到，现安装的Vim的版本是8.0(7.4.1578以上)、同时支持Python 2.x和Python 3.x以及包含的补丁数1-698（大于1-578）。这种情况下可以进行后续的步骤，否则，请卸载现有的Vim重新安装满足条件的Vim。YCM作者建议安装64位的Vim。

![VIM_version](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/VIM_version.png)

**配置_vimrc**

这里有一份[_vimrc][vimrc example]供参考。里面已经有Vundle和YCM的配置，还没安装这两个插件时打开GVIM，会报错。忽略它，直接点确定。

我认为_vim应该自己折腾，所以就随便找了这个很简陋的_vimrc。网上的[spf13-vim][spf13]就是一个很全的配置，可以去学习借鉴。


### 安装Git

如图所示一步一步安装：

![Git_install.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/Git_install.gif)

建议把`C:\Program Files\Git\mingw64\libexec\git-core`也添加到环境变量。

通过`git --version`命令查看安装是否成功。

![Git_works.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/Git_works.gif)


### 安装curl

把`curl-7.54.1-win64-mingw.7z`解压缩之后重命名为`curl`，然后将`curl`目录复制到`C:\Program Files`,再将`C:\Program Files\curl\bin`添加到环境变量。

通过`curl --version`命令查看安装是否成功。

![curl_works.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/curl_works.gif)


### 安装Python

![Python_install.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/Python_install.gif)

安装完成后可以打开命令行提示符查看成不成功：

![Python_works.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/Python_works.gif)


### 安装CMake

![CMake_install.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/CMake_install.gif)

安装完成后可以打开命令行提示符查看成不成功：

![CMake_install.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/CMake_works.gif)

### 安装7-zip

过程略。


安装Vundle
----------

以管理员身份运行Git Bash，运行`git clone https://github.com/VundleVim/Vundle.vim.git "C:\Program Files (x86)\Vim\vim80\bundle\Vundle.vim"`。

![Vundle_install.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/Vundle_install.gif)

上面命令中的`"C:\Program Files (x86)\Vim\vim80\bundle\Vundle.vim"`根据实际情况自定义。

**注意：** 我找到的很多教程都把Vundle安装在`C:\Program Files (x86)\Vim\vimfiles\bundle`。我也尝试过很多次安装在`vimfiles`，不过都一一失败了。后来安装在`vim80`就成了，所以我安装在`vim80`。

安装好之后，要配置_vimrc。刚才安装Vim时候已经配置了。

以管理员身份运行GVIM，执行`:PluginInstall`即可安装插件。安装速度随缘，有时候较慢，在等待过程中别关闭GVIM，可以继续安装还没安装的软件。

![Vundle_works.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/Vundle_works.gif)


安装YouCompleteMe(YCM)
----------------------

### 下载YCM

因为[_vimrc][vimrc example]内有一行`Plugin 'Valloric/YouCompleteMe'`，所以在[安装Vundle](#安装Vundle)那个步骤就已经下载了YCM。若你在执行`:PluginInstall`之前把`Plugin 'Valloric/YouCompleteMe'`删掉或注释掉了（[示例][Vundle_works]就是注释掉了），可以通过Git下载YCM。

以管理员身份打开Git Bashing，运行`git clone --recursive https://github.com/Valloric/YouCompleteMe.git "C:\Program Files (x86)\Vim\vim80\bundle\YouCompleteMe"`，然后等待……整个YouCompleteMe两百多M。


### 编译YCM

在YouComleteMe目录下有一个`install.py`文件，可以执行这个脚本自动编译。根据自己的实际需要决定支持哪些编程语言的补全。YCM除了支持Python、C系语言外，还支持C#、Go、TypeScript、JavaScript、Rust。


#### 使用脚本自动编译

**不需要C系语言的补全**

以管理员身份运行命令行提示符。执行`cd C:\Program Files (x86)\Vim\vim80\bundle\YouCompleteMe`进入`C:\Program Files (x86)\Vim\vim80\bundle\YouCompleteMe`目录，然后执行`install.py`。

![Compile_YCM_without_C_family.gif](https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/Compile_YCM_without_C_family.gif)

编译好使用前还要配置_vimrc。刚才安装Vim时候已经配置了。

**需要C系语言的补全**

新建`C:\Program Files (x86)\Vim\vim80\bundle\YouCompleteMe\third_party\ycmd\clang_archives`目录，将**LLVM-4.0.1-win64.exe**复制到该目录。编译完成之后可以删除LLVM-4.0.1-win64.exe。

之后的步骤和 **不需要C系语言的补全** 雷同，进入`C:\Program Files (x86)\Vim\vim80\bundle\YouCompleteMe`目录，然后执行`install.py --clang-completer`。

同样要配置_vimrc。刚才安装Vim时候已经配置了。

**其他语言的补全**

具体操作参考YCM的[Full Installation Guide][Full Install Guide]


#### 手动编译

具体操作参考YCM的[Full Installation Guide][Full Install Guide]。我照着做，并没有成功。考虑到自动编译都成功了，我想我的环境应该是没问题的，我不知道具体哪出了差错。


最后的最后
----------

之所以把安装编译的过程记录下来，是因为我在安装过程参考了很多别人的博客、文章、经验……现在我也写下自己的安装过程供像我一样菜的小白参考。

我在百度、谷歌教程时候，发现雷同的太多，在一定程度上干扰了我的搜索。因此我**强烈不建议**转载到其他能搜索到的地方，如果有人认可我写的这个小玩意，可以fork，可以保存到自己的笔记。总的原则就是别污染人家的搜索页面，别搞到整个页面基本是同一篇东西。

还有就是，手动编译那一块我不会，如果谁找到了用Visual Studio手动编译的教程，Let me know!


[Visual Studio download]: https://www.visualstudio.com/downloads/
[Python.org]:https://www.python.org/
[Python download]: https://www.python.org/downloads/windows/
[vim-win-download]: https://bintray.com/micbou/generic/vim
[vim-win32-installer-releases]:https://github.com/vim/vim-win32-installer/releases
[YouCompleteMe#windows]:https://github.com/Valloric/YouCompleteMe#windows
[LLVM Download Page]:http://releases.llvm.org/download.html
[Git Download 1]:https://git-for-windows.github.io/
[Git Download 2]:https://github.com/git-for-windows/git/releases
[curl Download]:https://curl.haxx.se/download.html
[CMake Download]:https://cmake.org/download/
[vimrc example]:https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/_vimrc
[spf13]:https://github.com/spf13/spf13-vim
[7-Zip Download]: http://www.7-zip.org/download.html
[Full Install Guide]:https://github.com/Valloric/YouCompleteMe#full-installation-guide
[Vundle_works]:https://github.com/Install-YouCompleteMe-on-Win64/Install-YouCompleteMe-on-Win64/blob/master/images/Vundle_works.gif
