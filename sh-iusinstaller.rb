require 'formula'

class ShIusinstaller < Formula
  homepage 'http://github.com/vimreapers'
  url 'https://github.com/vimreapers/homebrew-shell.git'
  
  depends_on "bash-completion" => :recommended

  def install
    bin.install 'sh-iusinstaller'
  end
end
