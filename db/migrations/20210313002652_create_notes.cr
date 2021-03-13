class CreateNotes::V20210313002652 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Note) do
      primary_key id : Int64
      add content : String
      add deleted_at : Time?
      add_belongs_to user : User, on_delete: :cascade
      add_timestamps
    end
  end

  def rollback
    drop table_for(Note)
  end
end
