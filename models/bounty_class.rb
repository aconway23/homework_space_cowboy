require ('pg')

class SpaceCowboy
  attr_accessor :name, :species, :homeworld, :favourite_weapon
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @species = options['species']
    @homeworld = options['homeworld']
    @favourite_weapon = options['favourite_weapon']

  end

  def save()
    db = PG.connect({
      dbname: 'homework_space_cowboys',
      host: 'localhost'

      })
      sql = "
      INSERT INTO space_cowboy
      (
      name,
      species,
      homeworld,
      favourite_weapon

      )
      VALUES
      (
      $1, $2, $3, $4
      )
      RETURNING *
      "
      values = [@name, @species, @homeworld, @favourite_weapon]
      db.prepare("save", sql)
      @id = db.exec_prepared("save", values)[0]['id'].to_i()
      db.close()
    end

    def self.all()
      db = PG.connect({
        dbname: 'homework_space_cowboys',
        host: 'localhost'
        })
      sql = "SELECT * FROM space_cowboy"
      values = []
      db.prepare("all", sql)
      bounty = db.exec_prepared("all", values)
      db.close()

      bounty_as_objects = bounty.map{ |bounty| SpaceCowboy.new(bounty)}
      return bounty_as_objects

    end

    def self.delete_all()
      db = PG.connect({
        dbname: 'homework_space_cowboys',
        host: 'localhost'
        })
        sql = "DELETE FROM space_cowboy"
        values = []
        db.prepare("delete_all", sql)
        db.exec_prepared("delete_all", values)
        db.close()
    end

    def delete()
      db = PG.connect({
        dbname: 'homework_space_cowboys',
        host: 'localhost'
        })
        sql = "DELETE FROM space_cowboy WHERE id = $1"
        values = [@id]
        db.prepare("delete_one", sql)
        db.exec_prepared("delete_one", values)
        db.close()

    end

    def update()
      db = PG.connect({
        dbname: 'homework_space_cowboys',
        host: 'localhost'
        })
        sql = "UPDATE space_cowboy SET (name, species, homeworld, favourite_weapon
        ) =
        (
        $1, $2, $3, $4
        ) WHERE id = $5
        "

        values = [@name, @species, @homeworld, @favourite_weapon, @id]
        db.prepare("update", sql)
        db.exec_prepared("update", values)
        db.close()

      end



end
