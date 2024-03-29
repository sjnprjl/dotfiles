#ENVIRONMENT VARIABLES

export PATH=~/.bin:$PATH
export PATH=~/.npm-global/bin:$PATH

#APPLICATION
export BROWSER=firefox
export TERMINAL=kitty

export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
# export JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dsun.java2d.opengl=true'

# unset JDK_JAVA_OPTIONS

SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
alias java='java "$SILENT_JAVA_OPTIONS"'

export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

export CHROME_EXECUTABLE="google-chrome-stable"

export PATH=$PATH:/usr/lib/dart/bin








