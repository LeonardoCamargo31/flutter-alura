import 'package:flutter/material.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:easy_debounce/easy_debounce.dart';

class CurrencyInputScreen extends StatefulWidget {
  @override
  _CurrencyInputScreenState createState() => _CurrencyInputScreenState();
}

class _CurrencyInputScreenState extends State<CurrencyInputScreen> {
  final CurrencyTextFieldController _controller = CurrencyTextFieldController(
    currencySymbol: 'R\$ ',
    decimalSymbol: ',',
    thousandSymbol: '.',
    numberOfDecimals: 2,
  );

  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Campo de Moeda')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          child: TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_controller',
              Duration(milliseconds: 2000),
              () async {
                double? income = _controller.doubleValue;
                print('Renda mensal: $income');
                setState(() {});
              },
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              labelText: 'Renda Mensal',
              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'satoshi',
                    color: FlutterFlowTheme.of(context).colorWhite500,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
              hintText: 'Digite sua renda mensal',
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'satoshi',
                    color: FlutterFlowTheme.of(context).colorWhite500,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).colorBlue300,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primaryText,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).colorWhite100,
              contentPadding: EdgeInsetsDirectional.fromSTEB(16, 23, 16, 23),
              prefixIcon: Icon(Icons.attach_money, size: 24),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'satoshi',
                  color: Color(0xFF404040),
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
            cursorColor: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
      ),
    );
  }
}