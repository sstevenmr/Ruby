#****************************** Ejercicio #1 **********************************
module Actions

	#function palindromo
	def Actions.palindromo?(string)
		result = string.gsub(/\W/,"").gsub(/\d/,"")
		length = result.length
		length.times do |index|		
			if(result[index].downcase != result[length-index-1].downcase)
				return false
			end
		end
		return true
	end

	#function hash
	def Actions.cuenta_palabras(string)
		result = string.gsub(/\d/,"")
		words = Hash.new
		array = Array.new()
		result.scan(/\w+/) do |word|  array.push(word)  end
		(array.length).times do |i|
			count=0;
			(array.length).times do |j|
				if(array[i]==array[j])
					count += 1 
				end
			end
			words[array[i]] = count
		end
		return words
	end

	#function hanoi
	def Actions.hanoi(n_discos,t_origen,t_destino,t_alterna)
		if(n_discos==1)
			puts "mover disco de: #{t_origen}-->#{t_destino}"
		else
			hanoi(n_discos-1,t_origen,t_alterna,t_destino)
			puts "mover disco de: #{t_origen}-->#{t_destino}"
			hanoi(n_discos-1,t_alterna,t_destino,t_origen)

		end
	end

	#function sort
	def Actions.sort(array,asc)
		flag = true
		flag2=false;
	 	while(flag)
	 	 	flag = false
		 	(array.length-1).times do |i|
		 		if(asc)
		 			flag2 = array[i]>array[i+1]
		 		else		
		 			flag2 = array[i]<array[i+1]
		 		end
		 		if(flag2)
		 			temp = array[i]
		 			array[i] = array[i+1]
		 			array[i+1] = temp
		 			flag = true
		 		end	
		 	end
		end
		return array	
	end

	#function char_count
	def Actions.char_count(string,char)
		count = 0;
		(string.length).times do |index|
			if(string[index]==char)
				count +=1
			end
		end
		return count
	end

	def Actions.atoi(string)
		string = string.delete(',')
		result = /\D+/.match(string)
		number=0
		if(result==nil)
			(string.length).times do |index|
				number = number + (string[((string.length)-1)-index]).to_i*(10**index)
			end
			return number
		else
			puts "El String no puede ser convertido"
			return nil
		end
	end

end
##  test1 ##
#result = Actions.palindromo?("A man, a pla, a canal – Panama")
#result = Actions.cuenta_palabras("lola 3487378%%% 56555 lola a como estas? lola gato")
#result = Actions.hanoi(3,1,3,2)
#result = Actions.sort([1,4,0,3,6,3],false)
#result = Actions.char_count("holal","l")
#result = Actions.atoi("65561%")
#puts result


# ********************************* Ejercicio #2   **************************************
class Dessert
    def initialize(name, calories)
      @name = name
      @calories = calories
      @size = 0;
    end

    def set_name(string)
    	@name = string 
    end

    def get_name
    	return @name
    end

    def set_calories(string)
    	@calories = string 
    end

    def get_calories
    	return @calories
    end

    def set_size(string)
    	@size = string 
    end

    def get_size
    	return @size
    end

    def healthy?
      if(@calories<200)
      	return true
      end
      return false
    end
    
    def delicious?
      return true
    end
    
    def to_s
    	return "#{@name}, #{@calories}, #{@size} "
    end
end

class JellyBean < Dessert
	@@count=0;
    def initialize(name, calories, flavor)
      @name = name
      @calories = calories
      @flavor = flavor
      @@count+=1
    end

    def delicious?
      if(@flavor=="black licorice" || @name=="JellyBean")
      	return false
      end
      return true;
    end

    def set_flavor(string)
    	@flavor = string 
    end

    def get_flavor
    	return @flavor
    end

    def count
		return @@count;
	end
end
##  test2 ##
#t = Dessert.new("hola",200)
#uts t.delicious?

#t = JellyBean.new("Jeasd",198,"kkkala")
#puts t.count


# *************************************  Ejercicio #3 **************************  

module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end


class Rabbit
  include Action
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def run(velocidad)
  	t = 10/velocidad
  	sleep(t)
  	puts "distancia recorrida: 10 mettros \n tiempo: #{t}"
  end

end


class Cricket
  include Action
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def run
  	t = 10/velocidad
  	sleep(t)
  	puts "distancia recorrida: 10 mettros \n tiempo: #{t}"
  end

  def chirp
  	count = rand(90)+10
  	count.times do |index|
  		puts "#{count} , Chirp...chirp!!"
  	end
  end
end
##  test3 ##
#peter = Rabbit.new("Peter")
#jiminy = Cricket.new("Jiminy")

#peter.jump
#jiminy.jump


# ********************************** Ejercicio #4 **********************************

class Computer
    @@users = {}   
    @@hash = Hash.new
    def initialize username, password
        @username = username
        @password = password
        @files = {}
    end

    def get_hash
    	return @@hash
    end

    def create(name)
    	names = name+".rb"
    	time = Time.now
    	if(!@@hash.has_key?(names))
    		archivo = File.open(names, 'w') 
    		@@hash[names]= time.strftime("%d/%m/%Y %H:%M:%S")
    		archivo.close
    		puts "Archivo Creado"
    	else
    		puts "Error el Archivo ya esta creado"
    	end	
    	return nil
    end

    def ls(tabla = @@hash)
    	if(tabla!=@@hash)
    		if(tabla.has_key?("sort"))
    			if(tabla.has_value?("asc"))
    				tabla= @@hash.sort_by {|k,v| k }
    				tabla.each {|key, value| puts "#{key} #{value}" }
    			else
    				if(tabla.has_value?("desc"))
    					tabla= @@hash.sort_by {|k,v| k }.reverse
    					tabla.each {|key, value| puts "#{key} #{value}" }
    				end
    			end
    		else
    			puts tabla
    		end
    	else
    		tabla.each {|key, value| puts "#{key} #{value}" }
    	end
    	return nil
    end

    def rm(name)
    	if(@@hash.has_key?(name))
    		@@hash.delete(name)
    		File.delete(name)
    	else
    		puts "Error no existe ese archivo"	
    	end
    	return nil
    end
end

##  test4 ##
#computer = Computer.new("Steven","abc")
#computer.create("test")
#computer.create("test2")
#computer.create("test3")
#hash = Hash.new
#hash["sort"] = "desc"
#puts computer.ls(hash)
#computer.rm("test.rb")
#puts computer.ls(hash)


