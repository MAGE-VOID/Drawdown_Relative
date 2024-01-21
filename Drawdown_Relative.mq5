//+------------------------------------------------------------------+
//|                                    Current_Relative_Drawdown.mq5 |
//|                                                        Copyright |
//|                          https://www.mql5.com/en/users/neverwolf |
//+------------------------------------------------------------------+

#property copyright "Neverwolf"
#property link "https://www.mql5.com/en/users/neverwolf"
#property version "1.00"
#property script_show_inputs

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
input int MAGIC = 0;
//---
void OnStart()
{
    Comment(DoubleToString(DD_Relative(Symbol(), MAGIC)));
}
//-------------------------------------------------------------------+
//| Calculate Relative Drawdown Percent                              |
//+------------------------------------------------------------------+
double DD_Relative(string CurrentSymbol, int magic)
{
    double DD = 0.0;
    // Main Calculation
    DD = ((Current_LossOrProfit(CurrentSymbol, magic) * 100) / AccountInfoDouble(ACCOUNT_BALANCE));
    DD = NormalizeDouble(DD, 2);

    return (DD);
}
//+------------------------------------------------------------------+
//| Calculate all positions                                          |
//+------------------------------------------------------------------+
double Current_LossOrProfit(string CurrentSymbol, int magic)
{
    double Profit = 0;
    double Positionsprofit = 0.0;
    // Go through all positions
    for (int i = PositionsTotal() - 1; i >= 0; i--)
    {
        if (PositionGetTicket(i))
        {
            if (PositionGetInteger(POSITION_MAGIC) == magic && PositionGetString(POSITION_SYMBOL) == CurrentSymbol)
                Positionsprofit = Positionsprofit + PositionGetDouble(POSITION_COMMISSION) + PositionGetDouble(POSITION_SWAP) + PositionGetDouble(POSITION_PROFIT);
            Profit = NormalizeDouble(Positionsprofit, 2);
        }
    }
    return (Profit);
}
//+------------------------------------------------------------------+