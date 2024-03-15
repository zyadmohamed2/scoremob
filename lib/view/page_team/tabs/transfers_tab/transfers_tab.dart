import 'package:flutter/material.dart';
import 'package:scoremob/view/page_team/tabs/transfers_tab/transfer_card/transfer_card.dart';

import '../../model/transfer.dart';
import '../../model/transfers.dart';
import 'ins_outs_toggle.dart';

class TransfersTab extends StatefulWidget {
  TransfersTab({required this.transfers, required this.teamId, super.key});

  Transfers transfers;
  int teamId;

  @override
  State<TransfersTab> createState() => _TransfersTabState();
}

class _TransfersTabState extends State<TransfersTab> {
  List<Transfer> list = [];
  bool showIns = true;
  @override
  void initState() {
    list = widget.transfers.ins;
    showIns = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff5f5f5),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          InsOutsToggle(
            value: showIns,
            callback: (value) {
              setState(() {
                if (value) {
                  list = widget.transfers.ins;
                  showIns = true;
                } else {
                  list = widget.transfers.outs;
                  showIns = false;
                }
              });
            },
          ),
          ..._generateTransfers(),
        ],
      ),
    );
  }

  List<Widget> _generateTransfers() {
    return list
        .map((e) => TransferCard(transfer: e, teamId: widget.teamId))
        .toList();
  }
}
