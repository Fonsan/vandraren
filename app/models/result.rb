# coding: utf-8
class Result < ActiveRecord::Base
  validates_presence_of :person_id
  validates_presence_of  :competition_id
  validates_presence_of  :klass_id
  validates_presence_of  :time
  validates_presence_of  :time_diff
  
  validate :uniq

  validates_numericality_of :position,:only_integer => true
  
  validates_format_of :time,:with => /^\d+\:\d{2}$/, :message => 'måste vara i formatet mm:ss tex 1:02'
  validates_format_of :time_diff, :with => /^\d+\:\d{2}$/, :message => 'måste vara i formatet mm:ss tex 1:02'
  validates_format_of :time, :without => /-/, :message => 'får inte hinnehålla minustecken'
  validates_format_of :time_diff, :without => /-/, :message => 'får inte hinnehålla minustecken'
  

  belongs_to :klass

  belongs_to :person, :primary_key => :person_id
  belongs_to :competition, :primary_key => :competition_id

  attr_readonly(:points)

  include Eventor

  def uniq
    r = Result.find_by_competition_id_and_person_id(competition_id,person_id)
    errors.add(:person_id, "finns redan registrerad för den här tävlingen: #{r.person.full_name} #{r.time}") if r
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
  
  def time_string
    "#{time} - #{winner_time.join(":")} = #{time_diff}"
  end

  def runner_minutes
    m,s = time.split(":").map(&:to_i)
    m
  end
  
  def winner_time
    m,s = time.split(":").map(&:to_i)
    dm,ds = time_diff.split(":").map(&:to_i)
    m -= dm
    if (s = s - ds) < 0
      m -= 1
      s += 60
    end
    return m, s
  end

  def winner_minutes
    winner_time[0]
  end
end
