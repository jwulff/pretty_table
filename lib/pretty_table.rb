class PrettyTable
  attr_reader :data, :headers

  def initialize(data = [], headers = [])
    @data    = data
    @headers = headers
  end

  def to_s
    string = ''
    string << header_cells.join(' | ')
    string << "\n"
    string << divider_cells.join('-+-')
    string << "\n"
    data_rows.each do |data_cells|
      string << data_cells.join(' | ')
      string << "\n"
    end
    string
  end

  private
    def data_strings
      @data_strings ||= data.collect do |row|
        row.collect do |cell|
          if cell.is_a?(Numeric)
            [ cell.to_s.reverse.gsub(/(\d\d\d)(?=\d)(?!\d*\.)/,'\1,').reverse, :rjust ]
          else
            [ cell.to_s, :ljust ]
          end
        end
      end
    end
    
    def header_strings
      @header_strings ||= headers.collect do |cell|
        if cell.is_a?(Numeric)
          [ cell.to_s.reverse.gsub(/(\d\d\d)(?=\d)(?!\d*\.)/,'\1,').reverse, :center ]
        else
          [ cell.to_s, :center ]
        end
      end
    end
    
    def column_sizes
      unless @column_sizes
        @column_sizes = []
        ([header_strings] + data_strings).each do |row|
          row.each_with_index do |column, index|
            column_sizes[index] ||= 0
            size = column[0].size
            column_sizes[index] = size if size > column_sizes[index]
          end
        end
      end
      @column_sizes
    end
    
    def header_cells
      column_sizes.each_with_index.collect do |size, column|
        if header_strings[column]
          header_strings[column][0].send header_strings[column][1], size
        else
          ' ' * size
        end
      end
    end
    
    def divider_cells
      column_sizes.each_with_index.collect do |size, column|
        '-' * size
      end
    end
    
    def data_rows
      data_strings.collect do |row|
        data_cells row
      end
    end
    
    def data_cells(row)
      column_sizes.each_with_index.collect do |size, column|
        if row[column]
          row[column][0].send row[column][1], size
        else
          ' ' * size
        end
      end
    end
end
