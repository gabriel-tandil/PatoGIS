package ar.edu.unicen.exa.galvarez.patogis.servidor.modelo;

import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

public class ObservacionClimaExample {
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public ObservacionClimaExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	protected abstract static class GeneratedCriteria {
		protected List<Criterion> criteria;

		protected GeneratedCriteria() {
			super();
			criteria = new ArrayList<Criterion>();
		}

		public boolean isValid() {
			return criteria.size() > 0;
		}

		public List<Criterion> getAllCriteria() {
			return criteria;
		}

		public List<Criterion> getCriteria() {
			return criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			criteria.add(new Criterion(condition));
		}

		protected void addCriterion(String condition, Object value,
				String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property
						+ " cannot be null");
			}
			criteria.add(new Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1,
				Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property
						+ " cannot be null");
			}
			criteria.add(new Criterion(condition, value1, value2));
		}

		public Criteria andIdIsNull() {
			addCriterion("id is null");
			return (Criteria) this;
		}

		public Criteria andIdIsNotNull() {
			addCriterion("id is not null");
			return (Criteria) this;
		}

		public Criteria andIdEqualTo(Integer value) {
			addCriterion("id =", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotEqualTo(Integer value) {
			addCriterion("id <>", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThan(Integer value) {
			addCriterion("id >", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("id >=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThan(Integer value) {
			addCriterion("id <", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThanOrEqualTo(Integer value) {
			addCriterion("id <=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdIn(List<Integer> values) {
			addCriterion("id in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotIn(List<Integer> values) {
			addCriterion("id not in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdBetween(Integer value1, Integer value2) {
			addCriterion("id between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotBetween(Integer value1, Integer value2) {
			addCriterion("id not between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andSolIsNull() {
			addCriterion("sol is null");
			return (Criteria) this;
		}

		public Criteria andSolIsNotNull() {
			addCriterion("sol is not null");
			return (Criteria) this;
		}

		public Criteria andSolEqualTo(Boolean value) {
			addCriterion("sol =", value, "sol");
			return (Criteria) this;
		}

		public Criteria andSolNotEqualTo(Boolean value) {
			addCriterion("sol <>", value, "sol");
			return (Criteria) this;
		}

		public Criteria andSolGreaterThan(Boolean value) {
			addCriterion("sol >", value, "sol");
			return (Criteria) this;
		}

		public Criteria andSolGreaterThanOrEqualTo(Boolean value) {
			addCriterion("sol >=", value, "sol");
			return (Criteria) this;
		}

		public Criteria andSolLessThan(Boolean value) {
			addCriterion("sol <", value, "sol");
			return (Criteria) this;
		}

		public Criteria andSolLessThanOrEqualTo(Boolean value) {
			addCriterion("sol <=", value, "sol");
			return (Criteria) this;
		}

		public Criteria andSolIn(List<Boolean> values) {
			addCriterion("sol in", values, "sol");
			return (Criteria) this;
		}

		public Criteria andSolNotIn(List<Boolean> values) {
			addCriterion("sol not in", values, "sol");
			return (Criteria) this;
		}

		public Criteria andSolBetween(Boolean value1, Boolean value2) {
			addCriterion("sol between", value1, value2, "sol");
			return (Criteria) this;
		}

		public Criteria andSolNotBetween(Boolean value1, Boolean value2) {
			addCriterion("sol not between", value1, value2, "sol");
			return (Criteria) this;
		}

		public Criteria andLluviaIsNull() {
			addCriterion("lluvia is null");
			return (Criteria) this;
		}

		public Criteria andLluviaIsNotNull() {
			addCriterion("lluvia is not null");
			return (Criteria) this;
		}

		public Criteria andLluviaEqualTo(Boolean value) {
			addCriterion("lluvia =", value, "lluvia");
			return (Criteria) this;
		}

		public Criteria andLluviaNotEqualTo(Boolean value) {
			addCriterion("lluvia <>", value, "lluvia");
			return (Criteria) this;
		}

		public Criteria andLluviaGreaterThan(Boolean value) {
			addCriterion("lluvia >", value, "lluvia");
			return (Criteria) this;
		}

		public Criteria andLluviaGreaterThanOrEqualTo(Boolean value) {
			addCriterion("lluvia >=", value, "lluvia");
			return (Criteria) this;
		}

		public Criteria andLluviaLessThan(Boolean value) {
			addCriterion("lluvia <", value, "lluvia");
			return (Criteria) this;
		}

		public Criteria andLluviaLessThanOrEqualTo(Boolean value) {
			addCriterion("lluvia <=", value, "lluvia");
			return (Criteria) this;
		}

		public Criteria andLluviaIn(List<Boolean> values) {
			addCriterion("lluvia in", values, "lluvia");
			return (Criteria) this;
		}

		public Criteria andLluviaNotIn(List<Boolean> values) {
			addCriterion("lluvia not in", values, "lluvia");
			return (Criteria) this;
		}

		public Criteria andLluviaBetween(Boolean value1, Boolean value2) {
			addCriterion("lluvia between", value1, value2, "lluvia");
			return (Criteria) this;
		}

		public Criteria andLluviaNotBetween(Boolean value1, Boolean value2) {
			addCriterion("lluvia not between", value1, value2, "lluvia");
			return (Criteria) this;
		}

		public Criteria andNubesIsNull() {
			addCriterion("nubes is null");
			return (Criteria) this;
		}

		public Criteria andNubesIsNotNull() {
			addCriterion("nubes is not null");
			return (Criteria) this;
		}

		public Criteria andNubesEqualTo(String value) {
			addCriterion("nubes =", value, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesNotEqualTo(String value) {
			addCriterion("nubes <>", value, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesGreaterThan(String value) {
			addCriterion("nubes >", value, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesGreaterThanOrEqualTo(String value) {
			addCriterion("nubes >=", value, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesLessThan(String value) {
			addCriterion("nubes <", value, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesLessThanOrEqualTo(String value) {
			addCriterion("nubes <=", value, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesLike(String value) {
			addCriterion("nubes like", value, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesNotLike(String value) {
			addCriterion("nubes not like", value, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesIn(List<String> values) {
			addCriterion("nubes in", values, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesNotIn(List<String> values) {
			addCriterion("nubes not in", values, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesBetween(String value1, String value2) {
			addCriterion("nubes between", value1, value2, "nubes");
			return (Criteria) this;
		}

		public Criteria andNubesNotBetween(String value1, String value2) {
			addCriterion("nubes not between", value1, value2, "nubes");
			return (Criteria) this;
		}

		public Criteria andVientoIsNull() {
			addCriterion("viento is null");
			return (Criteria) this;
		}

		public Criteria andVientoIsNotNull() {
			addCriterion("viento is not null");
			return (Criteria) this;
		}

		public Criteria andVientoEqualTo(String value) {
			addCriterion("viento =", value, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoNotEqualTo(String value) {
			addCriterion("viento <>", value, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoGreaterThan(String value) {
			addCriterion("viento >", value, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoGreaterThanOrEqualTo(String value) {
			addCriterion("viento >=", value, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoLessThan(String value) {
			addCriterion("viento <", value, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoLessThanOrEqualTo(String value) {
			addCriterion("viento <=", value, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoLike(String value) {
			addCriterion("viento like", value, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoNotLike(String value) {
			addCriterion("viento not like", value, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoIn(List<String> values) {
			addCriterion("viento in", values, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoNotIn(List<String> values) {
			addCriterion("viento not in", values, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoBetween(String value1, String value2) {
			addCriterion("viento between", value1, value2, "viento");
			return (Criteria) this;
		}

		public Criteria andVientoNotBetween(String value1, String value2) {
			addCriterion("viento not between", value1, value2, "viento");
			return (Criteria) this;
		}

		public Criteria andTemperaturaIsNull() {
			addCriterion("temperatura is null");
			return (Criteria) this;
		}

		public Criteria andTemperaturaIsNotNull() {
			addCriterion("temperatura is not null");
			return (Criteria) this;
		}

		public Criteria andTemperaturaEqualTo(Double value) {
			addCriterion("temperatura =", value, "temperatura");
			return (Criteria) this;
		}

		public Criteria andTemperaturaNotEqualTo(Double value) {
			addCriterion("temperatura <>", value, "temperatura");
			return (Criteria) this;
		}

		public Criteria andTemperaturaGreaterThan(Double value) {
			addCriterion("temperatura >", value, "temperatura");
			return (Criteria) this;
		}

		public Criteria andTemperaturaGreaterThanOrEqualTo(Double value) {
			addCriterion("temperatura >=", value, "temperatura");
			return (Criteria) this;
		}

		public Criteria andTemperaturaLessThan(Double value) {
			addCriterion("temperatura <", value, "temperatura");
			return (Criteria) this;
		}

		public Criteria andTemperaturaLessThanOrEqualTo(Double value) {
			addCriterion("temperatura <=", value, "temperatura");
			return (Criteria) this;
		}

		public Criteria andTemperaturaIn(List<Double> values) {
			addCriterion("temperatura in", values, "temperatura");
			return (Criteria) this;
		}

		public Criteria andTemperaturaNotIn(List<Double> values) {
			addCriterion("temperatura not in", values, "temperatura");
			return (Criteria) this;
		}

		public Criteria andTemperaturaBetween(Double value1, Double value2) {
			addCriterion("temperatura between", value1, value2, "temperatura");
			return (Criteria) this;
		}

		public Criteria andTemperaturaNotBetween(Double value1, Double value2) {
			addCriterion("temperatura not between", value1, value2,
					"temperatura");
			return (Criteria) this;
		}

		public Criteria andIdObservacionIsNull() {
			addCriterion("id_observacion is null");
			return (Criteria) this;
		}

		public Criteria andIdObservacionIsNotNull() {
			addCriterion("id_observacion is not null");
			return (Criteria) this;
		}

		public Criteria andIdObservacionEqualTo(Integer value) {
			addCriterion("id_observacion =", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionNotEqualTo(Integer value) {
			addCriterion("id_observacion <>", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionGreaterThan(Integer value) {
			addCriterion("id_observacion >", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionGreaterThanOrEqualTo(Integer value) {
			addCriterion("id_observacion >=", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionLessThan(Integer value) {
			addCriterion("id_observacion <", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionLessThanOrEqualTo(Integer value) {
			addCriterion("id_observacion <=", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionIn(List<Integer> values) {
			addCriterion("id_observacion in", values, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionNotIn(List<Integer> values) {
			addCriterion("id_observacion not in", values, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionBetween(Integer value1, Integer value2) {
			addCriterion("id_observacion between", value1, value2,
					"idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionNotBetween(Integer value1,
				Integer value2) {
			addCriterion("id_observacion not between", value1, value2,
					"idObservacion");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table public.observacion_clima
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	public static class Criterion {
		private String condition;
		private Object value;
		private Object secondValue;
		private boolean noValue;
		private boolean singleValue;
		private boolean betweenValue;
		private boolean listValue;
		private String typeHandler;

		public String getCondition() {
			return condition;
		}

		public Object getValue() {
			return value;
		}

		public Object getSecondValue() {
			return secondValue;
		}

		public boolean isNoValue() {
			return noValue;
		}

		public boolean isSingleValue() {
			return singleValue;
		}

		public boolean isBetweenValue() {
			return betweenValue;
		}

		public boolean isListValue() {
			return listValue;
		}

		public String getTypeHandler() {
			return typeHandler;
		}

		protected Criterion(String condition) {
			super();
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List<?>) {
				this.listValue = true;
			} else {
				this.singleValue = true;
			}
		}

		protected Criterion(String condition, Object value) {
			this(condition, value, null);
		}

		protected Criterion(String condition, Object value, Object secondValue,
				String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, null);
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to
	 * the database table observacion_clima
	 * 
	 * @mbggenerated do_not_delete_during_merge Sat Jun 04 08:05:19 ART 2011
	 */
	public static class Criteria extends GeneratedCriteria {

		protected Criteria() {
			super();
		}
	}
}