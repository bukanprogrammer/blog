class ApplicationController < ActionController::Base
  before_action :prepare_meta_tags

  def prepare_meta_tags(options={})
    site_name = 'Bukan Programmer'
    title = 'Tempat Belajar Programming'
    description = 'Bukan Programmer merupakan media pembelajaran berbasis web yang membahas topik - topik menarik seputar Teknologi Informasi.'
    current_url = request.url
    base_url = request.base_url
    image = base_url + '/resources/images/bp-favicon.ico'

    defaults = {
      site: site_name,
      title: title,
      separator: '-',
      icon: image,
      canoncial: base_url,
      author: 'Dede Irwanto',
      index: true,
      follow: true,
      description: description,
      keywords: Category.all.map{|c| c.name},

      og: {
        locale: 'id',
        type: 'website',
        title: site_name + ' - ' + title,
        url: current_url,
        image: image,
        description: description
      },

      twitter: {
        card: 'summary',
        title: site_name + ' - ' + title,
        image: image,
        description: description
      }

    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
end
