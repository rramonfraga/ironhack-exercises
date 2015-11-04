class CheckLogin
  @@users = { "Lluis" => "arevalo",
               "Isaura" => "fontcuberta",
               "Christian" => "debarrio" }

  def self.valid_user_password? user, password
    if @@users[user] != nil
      @@users[user] == password
    end
  end
end