class Result < ActiveRecord::Base
  validates :person_id,:presence => true
  validates :competition_id,:presence => true
  validate :uniq
  validates :klass_id, :presence => true
  validates :position, :presence => true
  validates :time, :presence => true
  validates :time_diff, :presence => true

  belongs_to :klass

  belongs_to :person, :primary_key => :person_id
  belongs_to :competition, :primary_key => :competition_id

  attr_readonly(:points)

  include Eventor

  def uniq
    errors.add(:person_id, "finns redan") if Result.find_by_competition_id_and_person_id(competition_id,person_id)
  end

  #
  #Hej!
  #
  #Missade att godkänd tävling alltid ger minst 1 poäng.
  #
  #Klas
  #
  #Den 8 augusti 2010 20:18 skrev Klas Eriksson <klas.r.eriksson@gmail.com>:
  #Hej!
  #
  #Så här står det i tidningen:
  #
  #varje deltävling ger poäng enligt formeln:
  #
  #P = K - 60 * ( T - S ) / S
  #
  #P = erhållen poäng (decimaler strykes)
  #K = 100 för elit- och huvudklasser (även mästerskapsklasser)
  #K = 80 för övriga klasser
  #T = den tävlandes tid i minuter (sekunder strykes)
  #S = segrartiden i minuter (sekunder strykes)

  #
  def points
    k = klass.main_class ? 100 : 80
    t_s = time_diff.split(":").map(&:to_i)[0]
    
    res = k - (60 * t_s ).fdiv( winner_minutes)
    res = res.floor
    res < 1 ? 1 : res
   
  rescue
    0
  end

  def points_string
    k = klass.main_class ? 100 : 80
    t_s = time_diff.split(":").map(&:to_i)[0]
    "#{points} = #{k} - (60 * #{t_s}) / #{winner_minutes}"
  end

  def runner_minutes
    m,s = time.split(":").map(&:to_i)
    m
  end

  def winner_minutes
    m,s = time.split(":").map(&:to_i)
    wm,ws = time_diff.split(":").map(&:to_i)
    m += wm
    if (s + ws) > 59
      m += 1
    end
    m
  end
end
