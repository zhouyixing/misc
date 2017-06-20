export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m' 

export PREFIX_PATH=${HOME}/Self
if [ -d ${PREFIX_PATH} ] ; then
    export PATH=${PREFIX_PATH}/bin:${PATH}
    if [[ -n ${PKG_CONFIG_PATH} ]] ; then
        export PKG_CONFIG_PATH=${HOME}/Self/lib/pkgconfig:${PKG_CONFIG_PATH}
    else
        export PKG_CONFIG_PATH=${HOME}/Self/lib/pkgconfig
    fi

    if [[ -n ${C_INCLUDE_PATH} ]] ; then
        export C_INCLUDE_PATH=${PREFIX_PATH}/include:${C_INCLUDE_PATH}
    else
        export C_INCLUDE_PATH=${PREFIX_PATH}/include
    fi

    if [[ -n ${CPLUS_INCLUDE_PATH} ]] ; then
        export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${PREFIX_PATH}/include
    else
        export CPLUS_INCLUDE_PATH=${PREFIX_PATH}/include
    fi

    if [[ -n ${LD_LIBRARY_PATH} ]] ; then
        export LD_LIBRARY_PATH=.:${PREFIX_PATH}/lib:${LD_LIBRARY_PATH}
    else
        export LD_LIBRARY_PATH=.:${PREFIX_PATH}/lib
    fi

    if [[ -n ${LIBRARY_PATH} ]] ; then
        export LIBRARY_PATH=${PREFIX_PATH}/lib:${LIBRARY_PATH}
    else
        export LIBRARY_PATH=${PREFIX_PATH}/lib
    fi
fi

# export JAVA_HOME=${HOME}/Softwares/java-7-openjdk-amd64
# export JAVA_HOME=${HOME}/Softwares/jdk1.6.0_31
# export JAVA_HOME=${HOME}/Softwares/jdk1.8.0_102
# export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
# export JAVA_BIN=${JAVA_HOME}/jre/bin
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
if [ -d ${JAVA_HOME} ] ; then
    export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
    # export PATH=${JAVA_HOME}/bin:${PATH}
    JAVA_INCLUDE_PATH=${JAVA_HOME}/include
    JAVA_INCLUDE_PATH=${JAVA_INCLUDE_PATH}:${JAVA_INCLUDE_PATH}/linux

    if [[ -n ${C_INCLUDE_PATH} ]] ; then
        export C_INCLUDE_PATH=${JAVA_INCLUDE_PATH}:${C_INCLUDE_PATH}
    else
        export C_INCLUDE_PATH=${JAVA_INCLUDE_PATH}
    fi

    if [[ -n ${CPLUS_INCLUDE_PATH} ]] ; then
        export CPLUS_INCLUDE_PATH=${JAVA_INCLUDE_PATH}:${CPLUS_INCLUDE_PATH}
    else
        export CPLUS_INCLUDE_PATH=${JAVA_INCLUDE_PATH}
    fi
fi

ANDROID_SDK=${HOME}/.Android/Sdk
if [ -d ${ANDROID_SDK} ] ; then
    ANDROID_SDK_PLATFORM_TOOLS=${ANDROID_SDK}/platform-tools
    ANDROID_SDK_TOOLS=${ANDROID_SDK}/tools

    [ -d ${ANDROID_SDK_PLATFORM_TOOLS} ] && export PATH=${ANDROID_SDK_PLATFORM_TOOLS}:${PATH}
    [ -d ${ANDROID_SDK_TOOLS} ] && export PATH=${ANDROID_SDK_TOOLS}:${PATH}
    ANDROID_SDK_NDK_BUNDLE=${ANDROID_SDK}/ndk-bundle
fi

# ANDROID_SDK_NDK_BUNDLE=${HOME}/Softwares/android-ndk-r10e
[ -d ${ANDROID_SDK_NDK_BUNDLE} ] && export PATH=${ANDROID_SDK_NDK_BUNDLE}:${PATH}

# ANDROID_STUDIO=${HOME}/Softwares/android-studio/bin

# curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo -o ~/bin/repo
export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo/'

# Just for android
# execute command "prebuilts/misc/linux-x86/ccache/ccache -M 100G" for android project
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache

# Just for android studio
export IBUS_ENABLE_SYNC_MODE=1

# Just for BEAN TEE SDK
. ${HOME}/Self/bean/default.sh
