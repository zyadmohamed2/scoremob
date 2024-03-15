class Tackles {
  dynamic total;
  dynamic blocks;
  dynamic interceptions;

  Tackles({this.total, this.blocks, this.interceptions});

  factory Tackles.fromJson(Map<String, dynamic> json) => Tackles(
        total: json['total'] as dynamic,
        blocks: json['blocks'] as dynamic,
        interceptions: json['interceptions'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'blocks': blocks,
        'interceptions': interceptions,
      };
}
