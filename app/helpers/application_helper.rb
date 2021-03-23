module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def formatar(str)
    str = str.to_s
    str.tr(
          "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž+",
          "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz ")
    str = str.gsub(/\s+/, ' ')
    str = str.strip
    str =  str.split.map(&:capitalize).join(' ')
    str = str.gsub(' A ', ' a ')
    str = str.gsub(' Ao ', ' ao ')
    str = str.gsub(' Aos ', ' aos ')
    str = str.gsub(' As ', ' as ')
    str = str.gsub(' Ate ', ' ate ')
    str = str.gsub(' Com ', ' com ')
    str = str.gsub(' De ', ' de ')
    str = str.gsub(' Da ', ' das ')
    str = str.gsub(' Das ', ' das ')
    str = str.gsub(' Do ', ' do ')
    str = str.gsub(' Dos ', ' dos ')
    str = str.gsub(' E ', ' e ')
    str = str.gsub(' Em ', ' em ')
    str = str.gsub(' Para ', ' para ')
    str = str.gsub(' Na ', ' na ')
    str = str.gsub(' Nas ', ' nas ')
    str = str.gsub(' Ou ', ' ou ')
    str = str.gsub(' Pela ', ' pela ')
    str = str.gsub(' Pelas ', ' pelas ')
    str = str.gsub(' Pelo ', ' pelo ')
    str = str.gsub(' Pelos ', ' pelos ')
  end

end
