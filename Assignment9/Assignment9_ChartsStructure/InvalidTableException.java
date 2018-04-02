/**
 * Exception thrown to indicate that the data table to be read
 * does not meet the required .
 * @author Hari Narayan Sanadhya, Ireti Fasere, Jack Nelson
 * @version 1.0
 */

public class InvalidTableException extends RuntimeException {
  /**
     * Constructor.
     */
    public InvalidTableException() {
        super();
    }

    /**
   * @param message
   * @param cause
   * @param enableSuppression
   * @param writableStackTrace
   */
  public InvalidTableException(String message, Throwable cause, boolean enableSuppression,
      boolean writableStackTrace) {
    super(message, cause, enableSuppression, writableStackTrace);
  }

  /**
   * @param message
   * @param cause
   */
  public InvalidTableException(String message, Throwable cause) {
    super(message, cause);
  }

  /**
   * @param cause
   */
  public InvalidTableException(Throwable cause) {
    super(cause);
  }

  /**
     * Constructor.
   * @param arg0
   */
  public InvalidTableException(String cause) {
    super(cause);
  }

    /**
     * Get the difference between required and available account balances
     * @return required - available
     */
    public String getMessage() {
        return "Table must have only 2 or 3 columns - Category(or Time), data and GroupingColumn(optional - Categorical).";
    }
    
    public String toString() {
      return ("Data Format not supported. \n" + getMessage() + "\n" + super.toString());
      
    }
}
