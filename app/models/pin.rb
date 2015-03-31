class Pin < ActiveRecord::Base
     belongs_to :user
     has_attached_file :image, :styles => {
  :thumb    => ['100x100#',  :jpg, :quality => 100],
  :preview  => ['480x480#',  :jpg, :quality => 100],
  :large    => ['600>',      :jpg, :quality => 100],
  :retina   => ['1200>',     :jpg, :quality => 60]
},
:convert_options => {
  :thumb    => '-set colorspace sRGB -strip',
  :preview  => '-set colorspace sRGB -strip',
  :large    => '-set colorspace sRGB -strip',
  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
}
     validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)
     validates :image, presence: true
     validates :description, presence: true

   
end