require 'formula'

class Iusinstaller < Formula
  homepage 'http://github.com/vimreapers'
  head 'https://github.com/vimreapers/homebrew-shell.git'

  def install
    bin.install 'iusinstaller.sh'
  end
end
