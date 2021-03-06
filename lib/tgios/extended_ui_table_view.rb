module Tgios
  module ExtendedUITableView
    include PlasticCup

    def add_full_table_view_to(view, style=:grouped)
      style ||= :plain
      table = UITableView.send(style)
      CommonUIUtility.add_full_subview(view, table)
      table
    end

    def add_title_to_table_header(title, table)
      frame = table.bounds
      frame.size.height = 45
      table_header = UIView.alloc.initWithFrame(frame)
      table.tableHeaderView = table_header
      add_title_to_view(title, table_header)

    end

    def add_title_to_view(title, view)

      Motion::Layout.new do |l|
        l.view view
        l.subviews 'label' => Base.style(UILabel.new, text: title,
                                         font: UIFont.boldSystemFontOfSize(19),
                                         adjustsFontSizeToFitWidth: true)
        l.vertical '|-10-[label]|'
        l.horizontal '|-10-[label]-10-|'
      end
    end
  end
end