class HomeController < ApplicationController
  def index
    section_tech
  end

  private

    def section_tech
      @hash = {
        :ruby => {
          icon: 'icon-ruby.png',
          title: 'Ruby',
          description: 'Merupakan bahasa pemrograman dinamis berorientasi objek (OOP) yang menawarkan kesederhanaan dalam pengkodeannya. Pertama kali dibuat oleh Programmer asal Jepang, Yukihiro Matsumoto pada tahun 1993.'
        },
        :rails => {
          icon: 'icon-rails.png',
          title: 'Ruby on Rails',
          description: 'Ruby on Rails atau sering disebut dengan Rails merupakan sebuah framework yang diciptakan dengan bahasa pemrogramman Ruby. Rails sendiri pertama kali dikembangkan oleh David Heinemeier Hansson, yaitu seorang programmer dan pembalap.'
        },
        :ubuntu => {
          icon: 'icon-ubuntu.png',
          title: 'Linux Ubuntu',
          description: 'Pertama kali dirilis pada tahun 2004, Ubuntu adalah sebuah sistem operasi dan distribusi Linux berbasis Debian yang gratis dan open-source. Ubuntu dibangun dengan menggunakan infrastruktur Debian dan terdiri dari server, desktop, dan sistem operasi Linux.'
        }
      }
    end
end
