require "csv"

module Adapters
  class BnpFortisCsvAdapter
    def initialize(file_path, account_name)
      @file_path = file_path
      @account_name = account_name
    end

    def to_expenses
      # Read the CSV file
      data = ::CSV.read(@file_path, col_sep: ";", headers: true)

      # Skip the header and convert to an array of arrays
      data.map(&:to_h).map do |entry|
        Expense.new(
            execution_date: Date.strptime(entry["Date d'exécution"], "%d/%m/%Y"),
            expense_date: Date.strptime(entry["Date valeur"], "%d/%m/%Y"),
            amount: entry["Montant"].to_d,
            currency: entry["Devise du compte"],
            from_account: entry["Numéro de compte"],
            from_account_name: @account_name,
            transaction_type: entry["Type de transaction"],
            to_account: entry["Contrepartie"],
            to_account_name: entry["Nom de la contrepartie"],
            communication: entry["Communication"],
            details: entry["Détails"],
            status: entry["Statut"],
            reason_refused: entry["Motif du refus"]
          )
      end
    end
  end
end
