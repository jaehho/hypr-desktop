# Maintainer: Jaeho Cho <jaehho@github>
pkgname=hypr-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc='Virtual desktop manager and TUI for Hyprland'
arch=('any')
url='https://github.com/jaehho/hypr-desktop'
license=('MIT')
depends=('hyprland' 'python' 'jq' 'socat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
