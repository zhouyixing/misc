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

# export JAVA_HOME=${HOME}/Softwares/jdk1.8.0_77
# export JAVA_HOME=${HOME}/Softwares/jdk1.6.0_31
export JAVA_HOME=${HOME}/Softwares/java-7-openjdk-amd64
if [[ -n ${JAVA_HOME} ]] ; then
    export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
    export PATH=${JAVA_HOME}/bin:${PATH}
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

export ANDROID_NDK=${HOME}/Self/android-ndk-r10e
[ -d ${ANDROID_NDK} ] && export PATH=${ANDROID_NDK}:${PATH}

# Just for android
# execute command "prebuilts/misc/linux-x86/ccache/ccache -M 100G" for android project
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
