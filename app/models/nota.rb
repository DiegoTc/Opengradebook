class Nota < ActiveRecord::Base
	belongs_to :student
	belongs_to :subject

  #attr_accessible :examen_1, :examen_2, :examen_3, :examen_4,
  #                :acumulado_1, :acumulado_2, :acumulado_3, :acumulado_4,
  #                :subject_id, :student_id

  validates_presence_of :examen_1, :examen_2, :examen_3, :examen_4,
                        :acumulado_1, :acumulado_2, :acumulado_3, :acumulado_4,
                        :subject_id, :student_id
  validates_numericality_of :examen_1, :examen_2, :examen_3, :examen_4,
                            :acumulado_1, :acumulado_2, :acumulado_3, :acumulado_4,
                            :greater_than_or_equal_to => 0

  def set_notes_to_zero(subject_id, student_id)
    self.examen_1 = 0
    self.examen_2 = 0
    self.examen_3 = 0
    self.examen_4 = 0
    self.acumulado_1 = 0
    self.acumulado_2 = 0
    self.acumulado_3 = 0
    self.acumulado_4 = 0
    self.recuperacion_1 = 0
    self.recuperacion_2 = 0
    self.recuperacion_3 = 0
    self.recuperacion_4 = 0
    self.student_id = student_id
    self.subject_id = subject_id
    #
  end

  def total_parcial(number)
    case number
    when 1
      self.examen_1.to_f + self.acumulado_1.to_f + self.recuperacion_1.to_f
    when 2
      self.examen_2.to_f + self.acumulado_2.to_f + self.recuperacion_2.to_f
    when 3
      self.examen_3.to_f + self.acumulado_3.to_f + self.recuperacion_3.to_f
    when 4
      self.examen_4.to_f + self.acumulado_4.to_f + self.recuperacion_4.to_f
    else
      0.0
    end
  end

  def total_average
    #avg = ((self.examen_1.to_f + self.acumulado_1.to_f +  self.recuperacion_1.to_f) +
    #(self.examen_2.to_f + self.acumulado_2.to_f + self.recuperacion_2.to_f) +
    #(self.examen_3.to_f + self.acumulado_3.to_f + self.recuperacion_3.to_f) +
    #(self.examen_4.to_f + self.acumulado_4.to_f + self.recuperacion_4.to_f)) / 4
    
    #temporal fix
    count = 0
    sum = 0
    4.times do |t|
    	if total_parcial(t+1) > 0
    	    sum += total_parcial(t+1)
    	    count += 1
    	end	
    end

    avg = sum / count 
    avg
  end

  def examen(number)
    case number
    when 1
      self.examen_1.to_f
    when 2
      self.examen_2.to_f
    when 3
      self.examen_3.to_f
    when 4
      self.examen_4.to_f
    else
      0.0
    end
  end

  def acum(number)
    case number
    when 1
      self.acumulado_1.to_f
    when 2
      self.acumulado_2.to_f
    when 3
      self.acumulado_3.to_f
    when 4
      self.acumulado_4.to_f
    else
      0.0
    end
  end

  def acumulado(numero)
    case numero
      when 1
        self.acumulado_1.to_f
      when 2
        self.acumulado_2.to_f
      when 3
        self.acumulado_3.to_f
      when 4
        self.acumulado_4.to_f
      else
        0.0
    end
  end

  def recuperacion(numero)
    case numero
      when 1
        self.recuperacion_1.to_f
      when 2
        self.recuperacion_2.to_f
      when 3
        self.recuperacion_3.to_f
      when 4
        self.recuperacion_4.to_f
      else
        0.0
    end
  end
end
