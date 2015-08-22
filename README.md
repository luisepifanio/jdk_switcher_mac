# What JDK switcher is

This is a simple mac-specific script that switches between multiple JDK
versions ( just those availables via '/usr/libexec/java_home').

It was inspired on https://github.com/michaelklishin/jdk_switcher but
may be useful in other environments, too ( developers? ;) )

## Usage

Install one or more JDKs ( edit :) )

Then source `jdk_switcher_mac.sh` in the repository root and use the `jdk_switcher` function with one argument

``` bash
. ./jdk_switcher_mac.sh

jdk_switcher use 6
...
jdk_switcher use 1.6
jdk_switcher use 7
jdk_switcher home 8

```

### Commands

### JDK aliases

Supported aliases are:

 * jdk6
 * 1.6.0
 * 1.6
 * 6.0
 * 6
 * jdk7
 * 1.7.0
 * ...
 * jdk8

## How does it work?

Changes `JAVA_HOME` and includes `$JAVA_HOME/bin/` in $PATH, so same Java version
will be referenced in $JAVA_HOME and $PATH


## Why was this tool necessary?

Because it was a mess to change version of JDK according to project i was working on,
sometimes several at same time.

## License & Copyright

MIT LICENSE

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

