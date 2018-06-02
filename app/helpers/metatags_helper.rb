module MetatagsHelper
  def self.default_meta_tags
    {
      site: 'Failer',
      title: 'Failer',
      reverse: true,
      charset: 'utf-8',
      description: '失敗談をまとめたサイトです。',
      keywords: '失敗談,失敗,まとめ',
      canonical: ENV['ORIGIN_URL'],
      separator: '|',
      # icon: [
      #   { href: image_url('favicon.ico') },
      #   { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      # ],
      og: {
        site_name: 'Failer',
        title: 'Failer',
        description: '失敗談をまとめたサイトです。',
        type: 'website',
        url: ENV['ORIGIN_URL'],
        # image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: 'Failer',
      }
    }
  end
end
