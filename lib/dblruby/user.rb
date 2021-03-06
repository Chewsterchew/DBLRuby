# Find information about users.
class DBLRuby::User
  # Initialize the user
  # @param data [JSON] User object in JSON form.
  def initialize(data)
    @data = data
  end

  # @return data in raw json form.
  attr_reader :data

  alias_method :to_s, :data

  # Return the error if there is one, nil otherwise.
  # @return [String, nil] the error.
  def error
    @data['error']
  end

  # Return true if there is an error, false otherwise.
  # @return [true, false] if there is an error.
  def error?
    !@data['error'].nil?
  end

  # The id of the user.
  # @return [Integer] User ID in integer form.
  def id
    @data['id'].to_i
  end

  # The username of the user.
  # @return [String] the user's username.
  def username
    @data['username']
  end

  # The discriminator of the user.
  # @return [Integer] the user's discriminator without the #.
  def discriminator
    @data['discriminator'].delete('#')
  end

  alias_method :discrim, :discriminator
  alias_method :tag, :discriminator

  # Returns the user's distinct, which is the Username and Discriminator.
  # @return [String] the user's username + discrim.
  def distinct
    "#{username}\##{tag}"
  end

  # The cdn hash of the user's avatar if the user has none.
  # @return [String] the user's defAvatar.
  def defavatar
    @data['defAvatar']
  end

  # The avatar hash of the user's avatar.
  # @return [String] the user's avatar hash.
  def avatar
    @data['avatar']
  end

  # Get's the user's avatar as an img, ready to be used in image linking.
  # @return [String] the user's avatar link.
  def avatar_img
    "https://cdn.discordapp.com/avatars/#{id}/#{avatar}.webp?size=1024"
  end

  # The bio of the user.
  # @return [String] the user's bio.
  def bio
    @data['bio']
  end

  # The banner image url of the user
  # @return [String] the banner image url.
  def banner
    @data['banner']
  end

  # The social usernames of the user.
  # @return [Hash<String, String>] the user's social links.
  def social
    @data['social']
  end

  # Does the user have any social links? True if so, false if not.
  # @return [true, false] if the user has any social links.
  def social?
    @data['social'] != {}
  end

  # The youtube channel id of the user.
  # @return [String] the user's youtube channel link.
  def youtube
    @data['social']['youtube']
  end

  # The reddit username of the user.
  # @return [String] the user's reddit link.
  def reddit
    @data['social']['reddit']
  end

  # The twitter username of the user.
  # @return [String] the user's twitter link.
  def twitter
    @data['social']['twitter']
  end

  # The instagram username of the user.
  # @return [String] the user's instagram link.
  def instagram
    @data['social']['instagram']
  end

  # The github username of the user.
  # @return [String] the user's github link.
  def github
    @data['social']['github']
  end

  # The custom hex color of the user.
  # @return [String] the user's hex code for their page.
  def color
    @data['color']
  end

  alias_method :colour, :color

  # The supporter status of the user.
  # @return [true, false] the user's supporter status.
  def supporter?
    @data['supporter']
  end

  alias_method :supporter, :supporter?

  # The certified status of the user.
  # @return [true, false] the user's certified status.
  def certified?
    @data['certifiedDev']
  end

  alias_method :certified, :certified?
  alias_method :certifieddev, :certified
  alias_method :certifieddev?, :certified

  # The mod status of the user.
  # @return [true, false] the user's mod status.
  def mod?
    @data['mod']
  end

  alias_method :mod, :mod?

  # The website moderator status of the user.
  # @return [true, false] the user's website mod status.
  def webmod?
    @data['webMod']
  end

  alias_method :webmod, :webmod?

  # The admin status of the user.
  # @return [true, false] the user's admin status.
  def admin?
    @data['admin']
  end

  alias_method :admin, :admin?
end
